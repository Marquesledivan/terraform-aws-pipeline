
variable "github_oauth_token" {
  type        = string
  description = "GitHub OAuth Token with permissions to access private repositories"
}

variable "poll_source_changes" {
  type    = bool
}

variable "repo_owner" {
  type    = string
}

variable "repo_name" {
  type    = string
}

variable "branch" {
  type    = string
}
variable "region" {
  type    = string
}

variable "applicationname" {
  type    = string
}

variable "deploymentgroupname" {
  type    = string
}

variable "codepipeline" {
  type    = string
}

variable "namebucket" {
  type    = string
}

variable "topic" {
  type    = string
}

variable "ec2_tag_filter" {
  type    = string
}