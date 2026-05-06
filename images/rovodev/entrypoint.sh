#!/bin/sh
set -e

ROVODEV_PORT=${ROVODEV_PORT:-8123}
PROXY_PORT=${PROXY_PORT:-4100}
TIMEOUT=${STARTUP_TIMEOUT:-120}

echo "[rovodev] Starting acli rovodev serve on port ${ROVODEV_PORT}..."
acli rovodev serve "${ROVODEV_PORT}" --disable-session-token &
ACLI_PID=$!

echo "[rovodev] Waiting for acli to be ready (timeout: ${TIMEOUT}s)..."
elapsed=0
while ! nc -z 127.0.0.1 "${ROVODEV_PORT}" 2>/dev/null; do
    if [ "$elapsed" -ge "$TIMEOUT" ]; then
        echo "[rovodev] ERROR: timeout waiting for acli on :${ROVODEV_PORT}" >&2
        exit 1
    fi
    sleep 1
    elapsed=$((elapsed + 1))
done
echo "[rovodev] acli ready (${elapsed}s)"

echo "[rovodev] Starting proxy on port ${PROXY_PORT}..."
exec bun run /proxy/rovodev-proxy.ts \
    --rovodev-port "${ROVODEV_PORT}" \
    --proxy-port "${PROXY_PORT}"
