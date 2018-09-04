{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams",
        "logs:FilterLogEvents",
        "logs:GetLogEvents",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    },
    {
      "Effect":"Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject",
        "s3:PutObjectTagging",
        "s3:PutObjectVersionTagging",
        "s3:PutBucketVersioning",
        "s3:*"
      ],
      "Resource": [
        "${arn_s3_bucket}",
        "${arn_s3_bucket}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild"
      ],
      "Resource": [
        "${arn_codebuild}",
        "${arn_codebuild_integration_test}"
        ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecs:SubmitTaskStateChange",
        "ecs:RunTask",
        "ecs:UpdateContainerInstancesState",
        "ecs:UpdateContainerAgent",
        "ecs:StartTask",
        "ecs:RegisterContainerInstance",
        "ecs:SubmitContainerStateChange",
        "ecs:StopTask",
        "ecs:DescribeContainerInstances",
        "ecs:DeregisterContainerInstance",
        "ecs:DescribeTasks",
        "ecs:DescribeClusters"
      ],
      "Resource": [
        "arn:aws:ecs:${region}:${account_id}:cluster/${cluster}",
        "arn:aws:ecs:${region}:${account_id}:task-definition/${task_definition}:*",
        "arn:aws:ecs:${region}:${account_id}:task/*",
        "arn:aws:ecs:${region}:${account_id}:container-instance/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecs:DeregisterTaskDefinition",
        "ecs:Poll",
        "ecs:DiscoverPollEndpoint",
        "ecs:UpdateService",
        "ecs:CreateService",
        "ecs:StartTelemetrySession",
        "ecs:CreateCluster",
        "ecs:RegisterTaskDefinition",
        "ecs:DescribeServices",
        "ecs:DescribeTaskDefinition",
        "iam:PassRole"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:CompleteLayerUpload",
        "ecr:DescribeImages",
        "ecr:DescribeRepositories",
        "ecr:UploadLayerPart",
        "ecr:ListImages",
        "ecr:InitiateLayerUpload",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetRepositoryPolicy",
        "ecr:PutImage"
      ],
      "Resource": "${ecr_repo_arn}"
    }
  ]
}
