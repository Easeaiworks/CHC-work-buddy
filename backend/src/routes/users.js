// routes/users.js — User management for admin panel

import { Router } from 'express';
import { supabase } from '../index.js';
import { requireRole } from '../middleware/auth.js';
import { logger } from '../utils/logger.js';

export const usersRouter = Router();

// All user management requires admin or manager role
usersRouter.use(requireRole(['admin', 'manager']));

// GET /api/auth/users — List all users (admin/manager only)
usersRouter.get('/', async (req, res) => {
  try {
    const { data, error } = await supabase
      .from('profiles')
      .select('id, email, full_name, role, preferred_language, last_active_at, is_active, created_at')
      .order('created_at', { ascending: false });

    if (error) throw error;
    res.json({ users: data });
  } catch (err) {
    logger.error('List users error', { error: err.message });
    res.status(500).json({ error: 'Failed to fetch users' });
  }
});

// PATCH /api/auth/users/:id — Update role or status
usersRouter.patch('/:id', async (req, res) => {
  const { id } = req.params;
  const { role, is_active, preferred_language } = req.body;

  // Admins only can promote to admin
  if (role === 'admin' && req.user.role !== 'admin') {
    return res.status(403).json({ error: 'Only admins can grant admin role' });
  }

  const updates = {};
  if (role) updates.role = role;
  if (is_active !== undefined) updates.is_active = is_active;
  if (preferred_language) updates.preferred_language = preferred_language;

  if (Object.keys(updates).length === 0) {
    return res.status(400).json({ error: 'No valid fields to update' });
  }

  try {
    const { data, error } = await supabase
      .from('profiles')
      .update(updates)
      .eq('id', id)
      .select()
      .single();

    if (error) throw error;
    res.json({ user: data });
  } catch (err) {
    logger.error('Update user error', { error: err.message });
    res.status(500).json({ error: 'Failed to update user' });
  }
});

// DELETE /api/auth/users/:id — Deactivate (soft delete)
usersRouter.delete('/:id', requireRole(['admin']), async (req, res) => {
  const { id } = req.params;
  if (id === req.user.id) {
    return res.status(400).json({ error: 'Cannot deactivate your own account' });
  }
  try {
    await supabase.from('profiles').update({ is_active: false }).eq('id', id);
    res.json({ success: true });
  } catch (err) {
    res.status(500).json({ error: 'Failed to deactivate user' });
  }
});
