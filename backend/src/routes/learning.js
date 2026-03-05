// routes/learning.js — Learning tab: troubleshooting guides, quizzes, skill assessments

import { Router } from 'express';
import { supabase } from '../index.js';
import { logger } from '../utils/logger.js';

export const learningRouter = Router();

// ─── GET /api/learning/guides — List all active troubleshooting guides ───
learningRouter.get('/guides', async (req, res) => {
  try {
    const { data, error } = await supabase
      .from('troubleshooting_guides')
      .select('id, slug, title_en, title_fr, title_es, description_en, description_fr, description_es, category, icon')
      .eq('is_active', true)
      .order('created_at', { ascending: true });

    if (error) throw error;
    res.json({ guides: data || [] });
  } catch (err) {
    logger.error('Failed to fetch guides', { error: err.message });
    res.status(500).json({ error: 'Failed to fetch guides' });
  }
});

// ─── GET /api/learning/guides/:slug — Single guide with full decision tree ───
learningRouter.get('/guides/:slug', async (req, res) => {
  try {
    const { data, error } = await supabase
      .from('troubleshooting_guides')
      .select('*')
      .eq('slug', req.params.slug)
      .eq('is_active', true)
      .single();

    if (error || !data) return res.status(404).json({ error: 'Guide not found' });
    res.json({ guide: data });
  } catch (err) {
    logger.error('Failed to fetch guide', { error: err.message });
    res.status(500).json({ error: 'Failed to fetch guide' });
  }
});

// ─── GET /api/learning/quizzes — List quizzes with user's best score ─────
learningRouter.get('/quizzes', async (req, res) => {
  const userId = req.user.id;
  try {
    const { data: quizzes, error } = await supabase
      .from('quizzes')
      .select('id, slug, title_en, title_fr, title_es, description_en, description_fr, description_es, quiz_type, passing_score, icon')
      .eq('is_active', true)
      .order('created_at', { ascending: true });

    if (error) throw error;

    // Fetch user's best attempt for each quiz
    const { data: attempts } = await supabase
      .from('user_quiz_attempts')
      .select('quiz_id, score, total_questions, passed')
      .eq('user_id', userId)
      .order('score', { ascending: false });

    const bestAttempts = {};
    for (const a of (attempts || [])) {
      if (!bestAttempts[a.quiz_id]) bestAttempts[a.quiz_id] = a;
    }

    const enriched = (quizzes || []).map(q => ({
      ...q,
      bestScore: bestAttempts[q.id]?.score ?? null,
      bestTotal: bestAttempts[q.id]?.total_questions ?? null,
      passed: bestAttempts[q.id]?.passed ?? null,
    }));

    res.json({ quizzes: enriched });
  } catch (err) {
    logger.error('Failed to fetch quizzes', { error: err.message });
    res.status(500).json({ error: 'Failed to fetch quizzes' });
  }
});

// ─── GET /api/learning/quizzes/:slug — Quiz with questions and answers ───
learningRouter.get('/quizzes/:slug', async (req, res) => {
  try {
    const { data: quiz, error } = await supabase
      .from('quizzes')
      .select('*')
      .eq('slug', req.params.slug)
      .eq('is_active', true)
      .single();

    if (error || !quiz) return res.status(404).json({ error: 'Quiz not found' });

    const { data: questions } = await supabase
      .from('quiz_questions')
      .select('id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es')
      .eq('quiz_id', quiz.id)
      .order('question_order', { ascending: true });

    const questionIds = (questions || []).map(q => q.id);
    const { data: answers } = await supabase
      .from('quiz_answers')
      .select('id, question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct')
      .in('question_id', questionIds)
      .order('answer_order', { ascending: true });

    // Group answers by question
    const answerMap = {};
    for (const a of (answers || [])) {
      if (!answerMap[a.question_id]) answerMap[a.question_id] = [];
      answerMap[a.question_id].push(a);
    }

    const questionsWithAnswers = (questions || []).map(q => ({
      ...q,
      answers: answerMap[q.id] || [],
    }));

    res.json({ quiz, questions: questionsWithAnswers });
  } catch (err) {
    logger.error('Failed to fetch quiz', { error: err.message });
    res.status(500).json({ error: 'Failed to fetch quiz' });
  }
});

// ─── POST /api/learning/quizzes/:id/submit — Submit quiz answers ─────────
learningRouter.post('/quizzes/:id/submit', async (req, res) => {
  const userId = req.user.id;
  const quizId = req.params.id;
  const { answers: userAnswers, timeSpent } = req.body;
  // userAnswers = { questionId: answerId, ... }

  if (!userAnswers || typeof userAnswers !== 'object') {
    return res.status(400).json({ error: 'Answers are required' });
  }

  try {
    // Fetch quiz + correct answers
    const { data: quiz } = await supabase.from('quizzes').select('*').eq('id', quizId).single();
    if (!quiz) return res.status(404).json({ error: 'Quiz not found' });

    const { data: questions } = await supabase
      .from('quiz_questions').select('id, question_order').eq('quiz_id', quizId);
    const questionIds = (questions || []).map(q => q.id);

    const { data: correctAnswers } = await supabase
      .from('quiz_answers').select('id, question_id, is_correct')
      .in('question_id', questionIds)
      .eq('is_correct', true);

    const correctMap = {};
    for (const a of (correctAnswers || [])) {
      correctMap[a.question_id] = a.id;
    }

    // Score
    let score = 0;
    const results = [];
    for (const q of (questions || [])) {
      const userAnswer = userAnswers[q.id];
      const correct = correctMap[q.id] === userAnswer;
      if (correct) score++;
      results.push({ questionId: q.id, userAnswer, correctAnswer: correctMap[q.id], correct });
    }

    const totalQuestions = questions?.length || 0;
    const percentage = totalQuestions > 0 ? Math.round((score / totalQuestions) * 100) : 0;
    const passed = percentage >= quiz.passing_score;

    // Save attempt
    await supabase.from('user_quiz_attempts').insert({
      user_id: userId,
      quiz_id: quizId,
      score: percentage,
      total_questions: totalQuestions,
      passed,
      answers: results,
      time_spent_seconds: timeSpent || null,
    });

    res.json({
      score,
      totalQuestions,
      percentage,
      passingScore: quiz.passing_score,
      passed,
      results,
    });
  } catch (err) {
    logger.error('Failed to submit quiz', { error: err.message });
    res.status(500).json({ error: 'Failed to submit quiz' });
  }
});

// ─── GET /api/learning/progress — User's overall learning stats ──────────
learningRouter.get('/progress', async (req, res) => {
  const userId = req.user.id;
  try {
    const { data: attempts } = await supabase
      .from('user_quiz_attempts')
      .select('quiz_id, score, total_questions, passed, completed_at')
      .eq('user_id', userId)
      .order('completed_at', { ascending: false });

    const quizzesTaken = new Set((attempts || []).map(a => a.quiz_id)).size;
    const quizzesPassed = new Set((attempts || []).filter(a => a.passed).map(a => a.quiz_id)).size;
    const totalAttempts = (attempts || []).length;
    const avgScore = totalAttempts > 0
      ? Math.round((attempts || []).reduce((s, a) => s + a.score, 0) / totalAttempts)
      : 0;

    res.json({
      quizzesTaken,
      quizzesPassed,
      totalAttempts,
      avgScore,
      recentAttempts: (attempts || []).slice(0, 10),
    });
  } catch (err) {
    logger.error('Failed to fetch progress', { error: err.message });
    res.status(500).json({ error: 'Failed to fetch progress' });
  }
});
