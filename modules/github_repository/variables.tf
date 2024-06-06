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

variable "github_branch_protection_defaults" {
  type = object({
    enforce_admins                  = bool,
    allows_deletions                = bool,
    allows_force_pushes             = bool,
    require_signed_commits          = bool,
    require_conversation_resolution = bool,
    required_pull_request_reviews   = map(string)
    pull_request_bypassers          = set(string)
  })

  default = {
    enforce_admins                  = true
    allows_deletions                = false
    allows_force_pushes             = false
    require_signed_commits          = false
    require_conversation_resolution = true
    required_pull_request_reviews = {
      dismiss_stale_reviews           = true
      restrict_dismissals             = true
      required_approving_review_count = 2
      require_last_push_approval      = true
    }
    pull_request_bypassers = ["/volodymyr-devops"]
  }
}