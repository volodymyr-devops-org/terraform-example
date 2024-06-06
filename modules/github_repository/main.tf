resource "github_repository" "this" {
  name        = var.repo_name
  description = var.repo_description
  visibility  = var.repo_visibility
  auto_init   = var.repo_auto_init
}

output "gh_repo_homepage_url" {
  value       = github_repository.this.html_url
  description = "The html_url of the project repo"
}

output "gh_repo_name" {
  value       = github_repository.this.name
  description = "The name of the project repo"
}

resource "github_branch" "this" {
  for_each   = { for b in var.repo_branches : b.name => b }
  repository = github_repository.this.name
  branch     = each.value.name
}

resource "github_branch_protection" "main" {

  for_each   = { for b in var.repo_branches : b.name => b if b.enable_protection }
  repository_id = github_repository.this.node_id

  pattern                         = each.value.name
  enforce_admins                  = var.github_branch_protection_defaults.enforce_admins
  allows_deletions                = var.github_branch_protection_defaults.allows_deletions
  allows_force_pushes             = var.github_branch_protection_defaults.allows_force_pushes
  require_signed_commits          = var.github_branch_protection_defaults.require_signed_commits
  require_conversation_resolution = var.github_branch_protection_defaults.require_conversation_resolution

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.github_branch_protection_defaults.required_pull_request_reviews.dismiss_stale_reviews
    restrict_dismissals             = var.github_branch_protection_defaults.required_pull_request_reviews.restrict_dismissals
    required_approving_review_count = var.github_branch_protection_defaults.required_pull_request_reviews.required_approving_review_count
    require_last_push_approval      = var.github_branch_protection_defaults.required_pull_request_reviews.require_last_push_approval
    pull_request_bypassers          = var.github_branch_protection_defaults.pull_request_bypassers
  }

  depends_on = [github_branch.this]
}