variable "build_spec" {
  description = "Build spec file"
  default     = "buildspec.yml"
}

variable "test_spec" {
  description = "Test spec file"
  default     = "testspec.yml"
}

variable "project_name" {
  description = "Name for the project"
  default     = ""
}

variable "project_name_integration_test" {
  description = "Name for the project for integration tests (codebuild)"
  default     = ""
}

variable "github_org" {
  description = "(Just) the Github org name"
}

variable "github_repo" {
  description = "(Just) the Github repo name"
}

variable "github_branch" {
  description = "(Just) the Github branch name"
  default     = "master"
}

variable "github_oauth_token" {
  description = "OAuth token for Github to setup webhooks"
}

variable "github_poll_for_changes" {
  description = "Poll Github for changes"
  default     = "true"
}

variable "github_clone_depth" {
  description = "Clone depth for github"
  default     = "1"
}

variable "project_description" {
  description = "Optional description for project"
  default     = ""
}

variable "tags" {
  description = "Tags for the codebuild project"

  default {
    Author = "rms1000watt"
  }
}

variable "build_timeout" {
  description = "Time in minutes before timing out on a build"
  default     = "60"
}

variable "builder_size" {
  description = "Size for the builder image (small, medium, large)"
  default     = "small"
}

variable "env_keys" {
  description = "Array of env var keys"
  default     = ["___0"]
}

variable "env_vals" {
  description = "Array of env var vals"
  default     = ["___0"]
}

variable "builder_role_arn" {
  description = "Optional Role arn to override for the builder container"
  default     = ""
}

variable "builder_image" {
  description = "Docker image for the builder container"
  default     = "aws/codebuild/docker:17.09.0"
}

variable "artifacts_type" {
  description = "Type of artifacts (either: NO_ARTIFACTS or CODEPIPELINE)"
  default     = "NO_ARTIFACTS"
}

variable "pipeline_role_arn" {
  description = "Optional Role arn to override for the builder container"
  default     = ""
}

variable "ecs_cluster" {
  description = "Name of ECS Cluster"
}

variable "ecs_service" {
  description = "Name of ECS Service"
}

variable "ecs_task_definition" {
  description = "Name of ECS Task Definition"
}

variable "ecr_repo" {
  description = "Name of the ecr repo in the same account and region as this pipeline"
  default     = ""
}

variable "vpc_id" {
  description = "ID of VPC to run within"
  default     = ""
}

variable "subnets" {
  description = "IDs of subnets to run within"
  default     = []
}

variable "security_groups" {
  description = "IDs of security groups to attach"
  default     = []
}
