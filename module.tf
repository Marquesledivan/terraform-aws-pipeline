provider "aws" {
  region = "us-east-1"
}
module "ecs_push_pipeline" {
  source              = "./pipeline"
  github_oauth_token  = XXXXXXXXXXXXX
  repo_owner          = "Marquesledivan"
  repo_name           = "aws_pipeline"
  applicationname     = "pipeline-ledivan"
  deploymentgroupname = "group-name-machine"
  branch              = "main"
  codepipeline        = "codepipeline"
  namebucket          = XXXXXXXXXXXXX
  topic               = XXXXXXXXXXXXX
  ec2_tag_filter      = "ledivan-web"
  region              = "us-east-1"
  poll_source_changes = "false"
}