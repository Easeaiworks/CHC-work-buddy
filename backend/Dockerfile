FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY backend/package.json backend/package-lock.json ./
RUN npm ci --omit=dev

# Copy source
COPY backend/src/ ./src/

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:${PORT:-3001}/health || exit 1

EXPOSE ${PORT:-3001}

CMD ["node", "src/index.js"]
