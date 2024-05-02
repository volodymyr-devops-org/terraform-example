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
  source = "../modules/github_repository"

  repo_name        = var.project_repo_name
  repo_description = var.project_repo_description
  repo_auto_init   = true
  repo_visibility  = "public"
}