resource "github_team" "some_team" {
  name        = var.team.name
  description = var.team.description
  privacy     = var.team.privacy
}

output "github_team_id" {
  value = github_team.some_team.id
}

resource "github_team_members" "some_team_members" {
  team_id = github_team.some_team.id

  dynamic "members" {
    for_each = var.team.members
    content {
      username = members.value.username
      role     = members.value.role
    }
  }
}