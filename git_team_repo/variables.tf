variable "team_name" {
  type        = string
  description = "Name of the team that needs to be created"
}

variable "team_description" {
  type        = string
  description = "Description that specifies the team "
}

variable "team_privacy" {
  type        = string
  description = "Team privacy whether it is secret or private"
}

variable "team_members_details" {
  type = list(object({
    username = string
    role     = string
  }))
  description = "description"
}
