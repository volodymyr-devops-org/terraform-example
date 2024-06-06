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