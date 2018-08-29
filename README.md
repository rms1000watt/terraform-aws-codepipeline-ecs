# Terraform AWS Codepipeline to ECS

## Introduction

This module sets up AWS Codepipeline that CI/CD to an existing ECS cluster

## Contents

- [Usage](#usage)

## Usage

```hcl
module "codepipeline_ecs" {
  source = "rms1000watt/codepipeline-ecs/aws"

  github_org  = "rms1000watt"
  github_repo = "dummy-golang-project"

  ecs_cluster = ""
  ecs_service = ""
}
```
