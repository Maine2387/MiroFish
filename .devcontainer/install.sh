#!/usr/bin/env bash
set -euo pipefail
python -m pip install 'uv==0.9.26'
npm ci
npm ci --prefix frontend
(cd backend && uv sync --frozen)
printf '\nReady. Add your Codespaces secrets, then run: bash .devcontainer/start.sh\n'
