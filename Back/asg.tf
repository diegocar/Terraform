resource "aws_autoscaling_group" "ASG-back" {
  name              = "${var.project_name}-asg"
  max_size          = 3
  min_size          = 0
  desired_capacity  = 0

  load_balancers = ["${aws_elb.web.name}"]

  launch_configuration = "${aws_launch_configuration.web.name}"
  vpc_zone_identifier  = ["${aws_subnet.Priv_subnet.id}"]

  tags = [
    {
      key                 = "responsible"
      value               = "dcarvajalc"
      propagate_at_launch = true
    },
    {
      key                 = "project"
      value               = "dcarvajalc-rampup"
      propagate_at_launch = true
    }
  ]
}
