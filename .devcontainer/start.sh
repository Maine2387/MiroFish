#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
for key in LLM_API_KEY ZEP_API_KEY LLM_BASE_URL LLM_MODEL_NAME; do
  if [ -z "${!key:-}" ]; then
    printf 'Missing %s. Add it in GitHub Codespaces secrets, then restart the Codespace.\n' "$key" >&2
    exit 1
  fi
done
export VITE_API_BASE_URL=/
export FLASK_DEBUG=False
export OASIS_DEFAULT_MAX_ROUNDS="${OASIS_DEFAULT_MAX_ROUNDS:-10}"
if [ -n "${CODESPACE_NAME:-}" ]; then
  export __VITE_ADDITIONAL_SERVER_ALLOWED_HOSTS="${CODESPACE_NAME}-3000.app.github.dev"
fi
npx concurrently --kill-others -n backend,frontend "npm run backend" "npm run frontend -- --host 0.0.0.0"
