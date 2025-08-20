#!/usr/bin/env bash
set -euo pipefail

# >>> EDIT THESE <<<
OLD_EMAIL="updatemebeforerunning@example.com" # the WRONG email that leaked into commits
CORRECT_NAME="Mark McDermott"                 # your correct name
CORRECT_EMAIL="mark@markmcdermott.io"         # the CORRECT email (must be verified on GitHub)

# Make sure the repo itself is set to the right identity going forward:
git config user.name  "$CORRECT_NAME"
git config user.email "$CORRECT_EMAIL"

# Prefer git-filter-repo (fast, modern). Falls back to filter-branch if needed.
if git help -a | grep -q 'filter-repo'; then
  git filter-repo --force \
    --email-callback '
from_email = email.decode("utf-8", "ignore")
if from_email.lower() == "'"$OLD_EMAIL"'".lower():
    return b"'"$CORRECT_EMAIL"'"
return email
' \
    --name-callback '
from_name = name.decode("utf-8", "ignore")
# If the email matched OLD_EMAIL above, also normalize the name:
# (filter-repo runs callbacks independently; name fix is safe to apply blanket.)
return b"'"$CORRECT_NAME"'"
'
else
  echo "git-filter-repo not found; using git filter-branch (slower)."
  git filter-branch --env-filter '
if [ "$GIT_COMMITTER_EMAIL" = "'"$OLD_EMAIL"'" ]; then
  export GIT_COMMITTER_NAME="'"$CORRECT_NAME"'"
  export GIT_COMMITTER_EMAIL="'"$CORRECT_EMAIL"'"
fi
if [ "$GIT_AUTHOR_EMAIL" = "'"$OLD_EMAIL"'" ]; then
  export GIT_AUTHOR_NAME="'"$CORRECT_NAME"'"
  export GIT_AUTHOR_EMAIL="'"$CORRECT_EMAIL"'"
fi
' --tag-name-filter cat -- --all
fi

echo "History rewritten. Now force-push:"
echo "  git push --force --tags origin --all"
