terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
  cloud {
    organization = "volodymyr-devops"
    workspaces {
      name = "intro-to-terraform-day-2-lab"
    }
  }
}

provider "github" {
  token = var.gh_token
  owner = var.gh_organization
}

module "gh_repository" {
  source = "./modules/github_repository"

  repo_name        = var.project_repo_name
  repo_description = var.project_repo_description
  repo_auto_init   = true
  repo_visibility  = "public"
  repo_branches    = var.project_repo_branches
}

module "gh_team" {
  source = "./modules/github_team"

  team = var.team_configuration
}

resource "github_team_repository" "some_team_repo" {
  team_id    = module.gh_team.github_team_id
  repository = var.project_repo_name
  permission = "pull"
}