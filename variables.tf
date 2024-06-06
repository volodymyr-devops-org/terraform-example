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

variable "project_repo_description" {
  description = "The description of the project repo"
  type        = string
  default     = "My awesome codebase"
}

variable "team_configuration" {
  description = "The configuration of the project team"
  type = object({
    name        = string
    description = string
    privacy     = string
    members = list(object({
      username = string
      role     = string
    }))
  })
}

variable "project_repo_branches" {
  description = "The configuration of the project repo branches"
  type = list(object({
    name              = string
    enable_protection = bool
  }))
  default = [
    {
      name              = "develop",
      enable_protection = "false"
    },
    {
      name              = "release",
      enable_protection = "true"
    },
    {
      name              = "main",
      enable_protection = "true"
    }
  ]
}