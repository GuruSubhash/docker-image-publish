FROM node:22-alpine AS base
WORKDIR /app

FROM ngrok/ngrok:latest AS ngrok

FROM base AS deps
COPY package*.json ./
RUN npm ci --omit=dev --ignore-scripts

FROM base AS runtime
ENV NODE_ENV=production
ENV PORT=3000

COPY --chown=node:node --from=deps /app/node_modules ./node_modules
COPY --chown=node:node src ./src
COPY --chown=node:node package*.json ./
COPY --from=ngrok /bin/ngrok /usr/local/bin/ngrok
COPY --chown=node:node docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

# Run as non-root user provided by the official Node image.
USER node

EXPOSE 3000
EXPOSE 4040

ENTRYPOINT ["./docker-entrypoint.sh"]
