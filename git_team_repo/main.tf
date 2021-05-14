resource "github_team" "raise_people_team" {
  name        = var.team_name
  description = var.team_description
  privacy     = var.team_privacy
}

/*
resource "github_team_membership" "raise_people_team_membership" {
  count    = length(var.team_members_details)
  team_id  = github_team.raise_people_team.id
  username = var.team_members_details[count.index].username
  role     = var.team_members_details[count.index].role
}
*/