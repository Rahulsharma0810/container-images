#!/bin/sh
set -eu

# Clear stale PID files so openchamber doesn't think a previous instance is running
rm -f "${HOME}/.config/openchamber/run/"*.pid 2>/dev/null || true

# Hand off to openchamber
exec sh /home/openchamber/openchamber-entrypoint.sh "$@"
