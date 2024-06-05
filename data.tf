# Retrieve information about the currently authenticated user.
data "github_user" "current" {
  username = ""
}

output "creator" {
  value = data.github_user.current.email
}