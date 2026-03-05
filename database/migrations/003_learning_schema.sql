-- Migration 003: Learning tab — troubleshooting guides, quizzes, skill assessments
-- Run this in Supabase SQL Editor

-- ─── Add "learning" workflow tab ─────────────────────────────
INSERT INTO public.workflow_tabs (slug, label_en, label_fr, label_es, icon, sort_order, color_hex)
VALUES ('learning', 'Learning', 'Apprentissage', 'Aprendizaje', 'learning', 6, '#ec4899')
ON CONFLICT (slug) DO NOTHING;

-- ─── Troubleshooting Guides ─────────────────────────────────
CREATE TABLE IF NOT EXISTS public.troubleshooting_guides (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  slug TEXT UNIQUE NOT NULL,
  title_en TEXT NOT NULL,
  title_fr TEXT NOT NULL,
  title_es TEXT NOT NULL,
  description_en TEXT,
  description_fr TEXT,
  description_es TEXT,
  category TEXT NOT NULL CHECK (category IN ('paint-defects', 'spray-booth', 'mixing', 'safety', 'general')),
  icon TEXT DEFAULT '🔧',
  node_tree JSONB NOT NULL,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ─── Quizzes ────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.quizzes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  slug TEXT UNIQUE NOT NULL,
  title_en TEXT NOT NULL,
  title_fr TEXT NOT NULL,
  title_es TEXT NOT NULL,
  description_en TEXT,
  description_fr TEXT,
  description_es TEXT,
  quiz_type TEXT NOT NULL CHECK (quiz_type IN ('skill-check', 'safety-certification', 'product-knowledge')),
  passing_score INTEGER DEFAULT 70,
  time_limit_minutes INTEGER,
  icon TEXT DEFAULT '📝',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ─── Quiz Questions ─────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.quiz_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  quiz_id UUID NOT NULL REFERENCES public.quizzes(id) ON DELETE CASCADE,
  question_order INTEGER NOT NULL,
  question_text_en TEXT NOT NULL,
  question_text_fr TEXT NOT NULL,
  question_text_es TEXT NOT NULL,
  question_type TEXT NOT NULL CHECK (question_type IN ('multiple-choice', 'true-false')),
  explanation_en TEXT,
  explanation_fr TEXT,
  explanation_es TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ─── Quiz Answers ───────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.quiz_answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  question_id UUID NOT NULL REFERENCES public.quiz_questions(id) ON DELETE CASCADE,
  answer_order INTEGER NOT NULL,
  answer_text_en TEXT NOT NULL,
  answer_text_fr TEXT NOT NULL,
  answer_text_es TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ─── User Quiz Attempts ─────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.user_quiz_attempts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  quiz_id UUID NOT NULL REFERENCES public.quizzes(id) ON DELETE CASCADE,
  score INTEGER NOT NULL,
  total_questions INTEGER NOT NULL,
  passed BOOLEAN NOT NULL DEFAULT false,
  answers JSONB DEFAULT '[]',
  time_spent_seconds INTEGER,
  completed_at TIMESTAMPTZ DEFAULT NOW()
);

-- ─── Indexes ────────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_quiz_questions_quiz ON public.quiz_questions(quiz_id, question_order);
CREATE INDEX IF NOT EXISTS idx_quiz_answers_question ON public.quiz_answers(question_id, answer_order);
CREATE INDEX IF NOT EXISTS idx_user_attempts_user ON public.user_quiz_attempts(user_id, quiz_id);
CREATE INDEX IF NOT EXISTS idx_user_attempts_date ON public.user_quiz_attempts(user_id, completed_at DESC);
CREATE INDEX IF NOT EXISTS idx_guides_category ON public.troubleshooting_guides(category);

-- ─── RLS Policies ───────────────────────────────────────────
ALTER TABLE public.troubleshooting_guides ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quizzes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_quiz_attempts ENABLE ROW LEVEL SECURITY;

-- Read policies (all authenticated users)
CREATE POLICY "guides_select" ON public.troubleshooting_guides FOR SELECT TO authenticated USING (true);
CREATE POLICY "quizzes_select" ON public.quizzes FOR SELECT TO authenticated USING (true);
CREATE POLICY "questions_select" ON public.quiz_questions FOR SELECT TO authenticated USING (true);
CREATE POLICY "answers_select" ON public.quiz_answers FOR SELECT TO authenticated USING (true);

-- Attempts: users see own, insert own
CREATE POLICY "attempts_select_own" ON public.user_quiz_attempts FOR SELECT TO authenticated
  USING (user_id = auth.uid());
CREATE POLICY "attempts_insert" ON public.user_quiz_attempts FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid());

-- Admin write for content tables
CREATE POLICY "guides_insert_admin" ON public.troubleshooting_guides FOR INSERT TO authenticated
  WITH CHECK (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role IN ('admin', 'manager')));
CREATE POLICY "quizzes_insert_admin" ON public.quizzes FOR INSERT TO authenticated
  WITH CHECK (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role IN ('admin', 'manager')));
