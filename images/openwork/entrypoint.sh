#!/bin/sh
set -e

echo "[openwork] Starting den-api on :8790..."
pnpm --filter @openwork-ee/den-api start &
API_PID=$!

echo "[openwork] Starting den-web on :3005..."
DEN_API_BASE="${DEN_API_BASE:-http://localhost:8790}" \
DEN_AUTH_ORIGIN="${DEN_AUTH_ORIGIN:-http://localhost:3005}" \
pnpm --filter @openwork-ee/den-web start &
WEB_PID=$!

# Exit if either process dies
wait -n
echo "[openwork] A process exited, shutting down..."
kill $API_PID $WEB_PID 2>/dev/null
wait
