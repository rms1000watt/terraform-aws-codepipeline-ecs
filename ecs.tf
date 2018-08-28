resource "aws_ecs_cluster" "0" {
  name = "${local.project_name}-cluster"
}

resource "aws_ecs_task_definition" "0" {
  family                   = "${local.project_name}-task-definition"
  container_definitions    = "${data.template_file.task_definition.rendered}"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.fargate_cpu}"
  memory                   = "${var.fargate_memory}"
  network_mode             = "awsvpc"

  task_role_arn      = "${aws_iam_role.ecs_tasks.arn}"
  execution_role_arn = "${aws_iam_role.ecs_tasks.arn}"
}

resource "aws_ecs_service" "0" {
  name            = "${local.project_name}-service"
  cluster         = "${aws_ecs_cluster.0.id}"
  task_definition = "${aws_ecs_task_definition.0.arn}"
  launch_type     = "FARGATE"

  desired_count                      = 0
  deployment_minimum_healthy_percent = 0

  network_configuration {
    security_groups = ["${aws_security_group.0.id}"]
    subnets         = ["${data.terraform_remote_state.core.public_subnets}"]
  }
}
