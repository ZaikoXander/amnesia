function amnb() {
  # If no arguments are provided, check out the default branch
  if [[ $# -eq 0 ]]; then
    # Get the remote HEAD symbolic ref, e.g. "origin/HEAD -> origin/main"
    local default_branch=$(_git_branch_default)

    if [[ -n "$default_branch" ]]; then
      echo "$default_branch"
    else
      echo "amnesia: no match found"
      return 1
    fi

    return
  fi

  # Join all arguments into a single query string
  local query="$*"

  # Use fuzzy search behind the scenes with full query
  local match=$(_git_branch_sorted_by_recent_commits | fzf --query="$query" --select-1 --exit-0)

  if [[ -n "$match" ]]; then
    echo "$match"
  else
    echo "amnesia: no match found"
    return 1
  fi
}

function amnbi() {
  # Join all arguments into a single query string
  local query="$*"

  local branches=$(_git_branch_sorted_by_recent_commits)

  # Use fzf to select a branch interactively
  local match
  if [[ -n "$query" ]]; then
    match=$(echo "$branches" | fzf --query="$query")
  else
    match=$(echo "$branches" | fzf)
  fi

  if [[ -n "$match" ]]; then
    echo "$match"
  else
    echo "amnesia: no match found"
    return 1
  fi
}
