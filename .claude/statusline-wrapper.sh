#!/bin/bash

# Read JSON input once
input=$(cat)

# Get git info from existing script
git_info=$(echo "$input" | bash ~/.claude/statusline-command.sh)

# Get context percentage from ccstatusline
context_pct=$(echo "$input" | npx ccstatusline)

# Reasoning effort level (absent when the model has no effort control)
effort=$(echo "$input" | jq -r '.effort.level // empty' 2>/dev/null)

# Combine outputs
printf '%s | %s' "$git_info" "$context_pct"
if [ -n "$effort" ]; then
  printf ' | \033[01;35mE: %s\033[00m' "$effort"
fi
