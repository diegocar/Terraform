resource "aws_autoscaling_group" "ASGFront" {
  name              = "${var.project_name}-asg"
  max_size          = 3
  min_size          = 0
  desired_capacity  = 0

  load_balancers = ["${aws_elb.ELBFront.name}"]

  launch_configuration = "${aws_launch_configuration.L_C_front.name}"
  vpc_zone_identifier  = ["${data.aws_subnet.Pub_F_subnet.id}"]

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
    },
  ]
}
