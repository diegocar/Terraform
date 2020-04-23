resource "aws_elb" "web" {
  name    = "${var.project_name}-elb-web"
  subnets = ["${aws_subnet.Pub_subnet.id}"]

  security_groups = ["${aws_security_group.allow_all.id}"]

  listener {
    instance_port     = 3000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 2
    target              = "HTTP:3000/"
    interval            = 10
  }

  tags = var.instance_tags
}
