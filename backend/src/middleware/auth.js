// middleware/auth.js — JWT + Supabase auth validation

import { supabase } from '../index.js';
import { logger } from '../utils/logger.js';

export async function authMiddleware(req, res, next) {
  const authHeader = req.headers.authorization;

  if (!authHeader?.startsWith('Bearer ')) {
    return res.status(401).json({ error: 'Missing or invalid authorization header' });
  }

  const token = authHeader.slice(7);

  try {
    // Verify token with Supabase
    const { data: { user }, error } = await supabase.auth.getUser(token);

    if (error || !user) {
      return res.status(401).json({ error: 'Invalid or expired token' });
    }

    // Get user profile with role
    const { data: profile } = await supabase
      .from('profiles')
      .select('id, email, full_name, role, preferred_language, is_active')
      .eq('id', user.id)
      .single();

    if (!profile?.is_active) {
      return res.status(403).json({ error: 'Account is inactive' });
    }

    req.user = { ...user, ...profile };
    next();

  } catch (error) {
    logger.error('Auth middleware error', { error: error.message });
    return res.status(401).json({ error: 'Authentication failed' });
  }
}

// Role-based access control
export function requireRole(roles) {
  return (req, res, next) => {
    if (!req.user) {
      return res.status(401).json({ error: 'Not authenticated' });
    }
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({ error: `Requires one of: ${roles.join(', ')}` });
    }
    next();
  };
}
