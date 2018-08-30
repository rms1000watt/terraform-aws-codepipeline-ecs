# Terraform AWS Codepipeline to ECS

## Introduction

This module sets up AWS Codepipeline that CI/CD to an existing ECS cluster

## Contents

- [Usage](#usage)
- [TODO](#todo)

## Usage

```hcl
module "codepipeline_ecs" {
  source = "rms1000watt/codepipeline-ecs/aws"

  github_org         = "rms1000watt"
  github_repo        = "dummy-golang-project"
  github_oauth_token = "0000000000000000000000000000000000"

  ecs_cluster         = "dummy-golang-project"
  ecs_service         = "dummy-golang-project"
  ecs_task_definition = "dummy-golang-project"
}
```

See `examples` folder for actual usage

## TODO

- [ ] Remove privileges (play game of least privileges)
