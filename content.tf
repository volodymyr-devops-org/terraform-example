resource "local_file" "readme" {
  content  = <<EOF
# Project ${var.project_name}

This is my README content.

## Team Members
${join("\n", [for member in var.team_configuration.members : "- ${member.username}"])}

## Other info
Last modified by: ${data.github_user.current.email} on ${formatdate("YYYY:MM:DD", timestamp())}.
EOF
  filename = "${path.module}/README.md"
}

resource "local_file" "gitignore" {
  content  = "*.tfstate\n*.tfstate.*\n*.tfvars\n.terraform/\n.terraform.lock.hcl\n"
  filename = "${path.module}/.gitignore"
}