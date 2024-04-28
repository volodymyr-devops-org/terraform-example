terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}

provider "github" {
  token = var.gh_token
  owner = var.gh_organization
}

resource "github_repository" "this" {
  name        = var.project_repo_name
  description = "My awesome codebase"

  visibility = "public"
  auto_init  = true
}

output "gh_repo_homepage_url" {
  value       = github_repository.this.html_url
  description = "The name of the project repo"
}

resource "github_team" "some_team" {
  name        = var.team_name
  description = "Some cool team"
  privacy     = "closed"
}

output "github_team_name" {
  value = var.team_name
}

resource "github_team_members" "some_team_members" {
  team_id = github_team.some_team.id

  dynamic "members" {
    for_each = var.team_members
    content {
      username = members.value
      role     = "maintainer"
    }
  }
}

resource "github_team_repository" "some_team_repo" {
  team_id    = github_team.some_team.id
  repository = github_repository.this.name
  permission = "pull"
}