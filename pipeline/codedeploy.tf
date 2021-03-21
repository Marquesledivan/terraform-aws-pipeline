resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.codedeploy.name
}

resource "aws_codedeploy_app" "codedeploy" {
  name = var.applicationname
}

resource "aws_sns_topic" "codedeploy" {
  name = var.topic
}

resource "aws_codedeploy_deployment_group" "codedeploy" {
  app_name              = var.applicationname
  deployment_group_name = var.deploymentgroupname
  service_role_arn      = aws_iam_role.codedeploy.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = var.ec2_tag_filter
    }
  }

  trigger_configuration {
    trigger_events     = ["DeploymentFailure"]
    trigger_name       = "codedeploy-trigger"
    trigger_target_arn = aws_sns_topic.codedeploy.arn
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = true
  }
}