function _git_branch_sorted_by_recent_commits() {
  command git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'
}
