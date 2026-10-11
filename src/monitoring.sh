#!/usr/bin/env bash
set -euo pipefail

INTERVAL="${1:-10}"
URL="${2:-http://127.0.0.1:5000/health}"

if [[ ! "$INTERVAL" =~ ^[1-9][0-9]*$ ]]; then
  echo "Error: interval harus berupa bilangan bulat positif." >&2
  exit 1
fi

echo "Memantau setiap $INTERVAL detik. Tekan Ctrl+C untuk berhenti."

while true; do
  if curl -fsS "$URL" >/dev/null 2>&1; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') status=UP"
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') status=DOWN"
  fi
  sleep "$INTERVAL"
done
