variable "repo_name" {
  description = "The name of the project repo"
  type        = string
}

variable "repo_description" {
  description = "The project repo description"
  type        = string
}

variable "repo_visibility" {
  description = "The project repo visibility"
  type        = string
}

variable "repo_auto_init" {
  description = "The project repo auto init bool"
  type        = bool
}

variable "repo_branches" {
  description = "The configuration of the project repo branches"
  type = list(object({
    name              = string
    enable_protection = bool
  }))
}