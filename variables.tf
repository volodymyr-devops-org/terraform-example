variable "gh_token" {
  type        = string
  description = "GitHub token"
}

variable "gh_organization" {
  type        = string
  description = "GH organization name"
  default     = "volodymyr-devops-org"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "terraform-example"
}

variable "project_repo_name" {
  description = "The name of the project repo"
  type        = string
  default     = "terraform-example"
}

variable "team_members" {
  description = "List of team members"
  type        = list(string)
}

variable "team_name" {
  description = "Team name"
  type        = string
  default     = "some-team"
}