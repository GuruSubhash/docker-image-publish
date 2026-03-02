#!/bin/sh
set -eu

if [ -z "${NGROK_AUTHTOKEN:-}" ]; then
  echo "NGROK_AUTHTOKEN is required." >&2
  exit 1
fi

APP_PORT="${PORT:-3000}"
NGROK_TARGET="${NGROK_TARGET:-http://127.0.0.1:${APP_PORT}}"

# cmd1: configure ngrok auth token
ngrok config add-authtoken "${NGROK_AUTHTOKEN}" >/dev/null

# cmd2: start Node app
node src/server.js &
APP_PID=$!

cleanup() {
  kill "${APP_PID}" 2>/dev/null || true
}

trap cleanup INT TERM EXIT

# cmd3: expose app over ngrok
if [ -n "${NGROK_DOMAIN:-}" ]; then
  ngrok http --log=stdout --domain="${NGROK_DOMAIN}" "${NGROK_TARGET}"
else
  ngrok http --log=stdout "${NGROK_TARGET}"
fi
