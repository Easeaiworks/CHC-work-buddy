// middleware/audit.js — Security audit trail

import { supabase } from '../index.js';
import { logger } from '../utils/logger.js';

export function auditMiddleware(req, res, next) {
  // Log AI queries for compliance and abuse detection
  const userId = req.user?.id;
  const action = `${req.method}:${req.path}`;

  // Non-blocking audit log
  supabase.from('audit_log').insert({
    user_id: userId,
    action,
    ip_address: req.ip,
    user_agent: req.get('user-agent'),
    metadata: {
      method: req.method,
      path: req.path,
      query: req.query,
    },
  }).then(({ error }) => {
    if (error) logger.warn('Audit log insert failed', { error: error.message });
  });

  next();
}
