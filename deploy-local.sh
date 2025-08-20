#!/usr/bin/env bash
set -euo pipefail

error() { echo "❌ $1" >&2; exit 1; }

echo "🔧 Installing dependencies…"
yarn install || error "Install failed."

echo "🏗️ Building and deploying via yarn…"
yarn build:deploy || error "Build or deploy failed."

echo "📦 Committing content changes…"
git add -A || error "git add failed."
if ! git diff --cached --quiet; then
  git commit -m "Update content: $(date '+%Y-%m-%d %H:%M:%S')" || error "git commit failed."
  echo "🚀 Pushing main branch…"
  git push || error "git push failed."
else
  echo "ℹ️ No content changes to commit."
fi

echo "✅ Deployment complete!"
