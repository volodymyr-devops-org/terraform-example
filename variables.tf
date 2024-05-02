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