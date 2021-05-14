variable "repo_name" {
  type        = string
  description = "Name of the github repository"
}

variable "repo_description" {
  type        = string
  description = "Description that specifies the purpose of the repository being created"
}

variable "visibility" {
  type        = string
  description = "To define whether the repository is private or not. Only private and public or internal are allowed"
}

variable "allow_merge_commit" {
  type        = bool
  description = "Configuration to allow merge commits directly to branches"
}

variable "allow_squash_merge" {
  type        = bool
  description = "Configuration to allow sqash merge directly to branches"
}

variable "allow_rebase_merge" {
  type        = bool
  description = "Configuration to allow rebase merge directly to branches"
}

variable "delete_branch_on_merge" {
  type        = bool
  description = "Configuration whether to allow delete branch on merge"
}

variable "gitignore_template" {
  type        = string
  description = "The gitignore template structure that need to be added to the repository"
}

variable "repo_permissions" {
  type = list(object({
    username   = string
    permission = string
  }))
  description = "Repository user permissions "
}

variable "default_branch_name" {
  type        = string
  description = "Branch name that should be set to default"
}

variable "webhook_url" {
  type        = string
  description = "Webhook URL for the repository to notify"
}

variable "webhook_content_type" {
  type        = string
  description = "Webhook URL payload data type"
}

variable "branch_protection_pattern" {
  type        = string
  description = "Pattern to reprasent branches that should have branch protection"
}

variable "enforce_admins" {
  type        = bool
  description = "Whether to enforce admin or not"
}

variable "dismissal_user_list" {
  type        = list(string)
  description = "List of users with dismissal permissions"
}

variable "dismissal_team_list" {
  type        = list(string)
  description = "List of teams with dismissal permissions"
}

variable "restriction_users" {
  type        = list(string)
  description = "Restriction user list"
}

variable "restriction_teams" {
  type        = list(string)
  description = "Restriction team list"
}

variable "restriction_apps" {
  type        = list(string)
  description = "Restriction apps"
}