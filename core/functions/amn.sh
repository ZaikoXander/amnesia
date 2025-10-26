function amn() {
  # Check for --pull option
  local pull_after_checkout=false
  local args=()
  
  # Parse arguments to extract --pull option
  for arg in "$@"; do
    if [[ "$arg" == "--pull" ]]; then
      pull_after_checkout=true
    else
      args+=("$arg")
    fi
  done

  # If no arguments are provided (excluding --pull), check out the default branch
  if [[ ${#args[@]} -eq 0 ]]; then
    # Get the remote HEAD symbolic ref, e.g. "origin/HEAD -> origin/main"
    local default_branch=$(_git_branch_default)

    if [[ -n "$default_branch" ]]; then
      command git checkout "$default_branch"
      if [[ "$pull_after_checkout" == true ]]; then
        command git pull
      fi
    else
      echo "amnesia: no match found"
      return 1
    fi

    return
  fi

  # Join remaining arguments into a single query string
  local query="${args[*]}"

  # Use fuzzy search behind the scenes with full query
  local match
  match=$(_git_branch_sorted_by_recent_commits | fzf --query="$query" --prompt="git checkout " --select-1 --exit-0) #  | head -n 1

  if [[ -n "$match" ]]; then
    command git checkout "$match"
    if [[ "$pull_after_checkout" == true ]]; then
      command git pull
    fi
  else
    echo "amnesia: no match found"
    return 1
  fi
}

function amni() {
  # Check for --pull option
  local pull_after_checkout=false
  local args=()
  
  # Parse arguments to extract --pull option
  for arg in "$@"; do
    if [[ "$arg" == "--pull" ]]; then
      pull_after_checkout=true
    else
      args+=("$arg")
    fi
  done

  # Join remaining arguments into a single query string
  local query="${args[*]}"

  local branches=$(_git_branch_sorted_by_recent_commits)

  # Use fzf to select a branch interactively
  local match
  if [[ -n "$query" ]]; then
    match=$(echo "$branches" | fzf --query="$query" --prompt="git checkout ")
  else
    match=$(echo "$branches" | fzf --prompt="git checkout ")
  fi

  if [[ -n "$match" ]]; then
    command git checkout "$match"
    if [[ "$pull_after_checkout" == true ]]; then
      command git pull
    fi
  else
    echo "amnesia: no match found"
    return 1
  fi
}
