#!/bin/sh
set -eu

# Start kimaki in background if already configured (has DB)
KIMAKI_DIR="${HOME}/.kimaki"
if [ -d "${KIMAKI_DIR}" ] && [ "$(ls -A "${KIMAKI_DIR}" 2>/dev/null)" ]; then
  echo "[kimaki-entrypoint] starting kimaki..."
  kimaki --data-dir "${KIMAKI_DIR}" &
else
  echo "[kimaki-entrypoint] kimaki not configured, skipping (run setup manually)"
fi

# Hand off to openchamber
exec /app/openchamber-entrypoint.sh "$@"
