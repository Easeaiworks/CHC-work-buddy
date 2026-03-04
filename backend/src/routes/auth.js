// routes/auth.js — Authentication endpoints using Supabase Auth

import { Router } from 'express';
import { supabase } from '../index.js';
import { logger } from '../utils/logger.js';

export const authRouter = Router();

// POST /api/auth/login
authRouter.post('/login', async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password required' });
  }

  try {
    const { data, error } = await supabase.auth.signInWithPassword({ email, password });
    if (error) return res.status(401).json({ error: error.message });

    // Get profile
    const { data: profile } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', data.user.id)
      .single();

    res.json({
      token: data.session.access_token,
      user: { ...data.user, ...profile },
    });
  } catch (err) {
    logger.error('Login error', { error: err.message });
    res.status(500).json({ error: 'Authentication failed' });
  }
});

// POST /api/auth/register
authRouter.post('/register', async (req, res) => {
  const { email, password, fullName } = req.body;
  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password required' });
  }

  try {
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: { data: { full_name: fullName } },
    });

    if (error) return res.status(400).json({ error: error.message });

    res.json({
      token: data.session?.access_token,
      user: data.user,
      message: 'Registration successful',
    });
  } catch (err) {
    logger.error('Register error', { error: err.message });
    res.status(500).json({ error: 'Registration failed' });
  }
});

// POST /api/auth/logout
authRouter.post('/logout', async (req, res) => {
  const token = req.headers.authorization?.slice(7);
  if (token) {
    await supabase.auth.admin.signOut(token).catch(() => {});
  }
  res.json({ success: true });
});
