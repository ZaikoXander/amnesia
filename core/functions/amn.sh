# Helper function to parse command line arguments and extract --pull option
_parse_amn_args() {
  local should_pull=false
  local remaining_args=()
  
  for arg in "$@"; do
    if [[ "$arg" == "--pull" ]]; then
      should_pull=true
    else
      remaining_args+=("$arg")
    fi
  done
  
  # Return results via global variables (bash limitation for multiple return values)
  _amn_should_pull="$should_pull"
  _amn_remaining_args=("${remaining_args[@]}")
}

# Helper function to checkout a branch and optionally pull
_checkout_and_pull() {
  local branch="$1"
  local should_pull="$2"
  
  if [[ -z "$branch" ]]; then
    echo "amnesia: no match found"
    return 1
  fi
  
  # Checkout the branch
  command git checkout "$branch"
  local checkout_status=$?
  
  # If checkout succeeded and --pull was requested, pull the changes
  if [[ $checkout_status -eq 0 && "$should_pull" == true ]]; then
    command git pull
  fi
  
  return $checkout_status
}

# Main function: checkout branch with fuzzy search (non-interactive)
function amn() {
  # Parse arguments to separate --pull option from branch query
  _parse_amn_args "$@"
  local should_pull="$_amn_should_pull"
  local search_args=("${_amn_remaining_args[@]}")
  
  # Case 1: No search arguments - checkout default branch
  if [[ ${#search_args[@]} -eq 0 ]]; then
    local default_branch=$(_git_branch_default)
    _checkout_and_pull "$default_branch" "$should_pull"
    return $?
  fi
  
  # Case 2: Search arguments provided - find matching branch with fuzzy search
  local query="${search_args[*]}"
  local selected_branch
  selected_branch=$(_git_branch_sorted_by_recent_commits | fzf \
    --query="$query" \
    --prompt="git checkout " \
    --select-1 \
    --exit-0)
  
  _checkout_and_pull "$selected_branch" "$should_pull"
}

# Interactive function: checkout branch with fuzzy search (interactive)
function amni() {
  # Parse arguments to separate --pull option from branch query
  _parse_amn_args "$@"
  local should_pull="$_amn_should_pull"
  local search_args=("${_amn_remaining_args[@]}")
  
  # Build the search query from remaining arguments
  local query="${search_args[*]}"
  
  # Get all branches sorted by recent commits
  local all_branches=$(_git_branch_sorted_by_recent_commits)
  
  # Use fzf for interactive branch selection
  local selected_branch
  if [[ -n "$query" ]]; then
    # Pre-populate search with query if provided
    selected_branch=$(echo "$all_branches" | fzf \
      --query="$query" \
      --prompt="git checkout ")
  else
    # Show all branches without pre-filtering
    selected_branch=$(echo "$all_branches" | fzf \
      --prompt="git checkout ")
  fi
  
  _checkout_and_pull "$selected_branch" "$should_pull"
}
