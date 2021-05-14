locals {
  repo_permissions = var.repo_permissions
}

resource "github_repository" "repo_name" {
  name                   = var.repo_name
  description            = var.repo_description
  visibility             = var.visibility
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  gitignore_template     = var.gitignore_template
}

resource "github_repository_collaborator" "repo_collaborator" {
  count      = length(local.repo_permissions)
  repository = var.repo_name
  username   = var.repo_permissions[count.index].username
  permission = var.repo_permissions[count.index].permission
}

resource "github_branch" "default_branch" {
  repository = github_repository.repo_name.name
  branch     = var.default_branch_name
}

resource "github_branch_default" "default" {
  repository = github_repository.repo_name.name
  branch     = github_branch.default_branch.branch
}

resource "github_repository_webhook" "repo_webhook" {
  repository = github_repository.repo_name.name
  configuration {
    url          = var.webhook_url
    content_type = var.webhook_content_type
    insecure_ssl = false
  }
  active = false
  events = ["issues"]
}


resource "github_branch_protection_v3" "example" {

  repository  = github_repository.repo_name.name
  branch         = var.branch_protection_pattern
  enforce_admins = var.enforce_admins

  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    dismissal_users       = var.dismissal_user_list
    dismissal_teams       = var.dismissal_team_list
  }

  restrictions {
    users = var.restriction_users
    teams = var.restriction_teams
    apps  = var.restriction_apps
  }
}

# adding comments to terraform new repo