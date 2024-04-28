resource "local_file" "readme" {
  content  = <<EOF
# Project ${var.project_name}

This is my README content.

## Team Members
${join("\n", [for member in var.team_members : "- ${member}"])}

## Other info
Last modified by: ${data.github_user.current.email} on ${formatdate("YYYY:MM:DD", timestamp())}.
EOF
  filename = "${path.module}/README.md"
}

resource "local_file" "gitignore" {
  content  = "*.tfstate\n*.tfstate.*\n*.tfvars\n.terraform/\n.terraform.lock.hcl\n"
  filename = "${path.module}/.gitignore"
}

resource "github_repository_file" "readme" {
  repository          = github_repository.this.name
  branch              = "main"
  file                = "README.md"
  content             = local_file.readme.content
  commit_message      = "Managed by Terraform"
  commit_author       = data.github_user.current.login
  commit_email        = data.github_user.current.email
  overwrite_on_create = true
}

resource "github_repository_file" "gitignore" {
  repository          = github_repository.this.name
  branch              = "main"
  file                = ".gitignore"
  content             = local_file.gitignore.content
  commit_message      = "Managed by Terraform"
  commit_author       = data.github_user.current.login
  commit_email        = data.github_user.current.email
  overwrite_on_create = true
}