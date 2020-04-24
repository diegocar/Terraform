resource "aws_autoscaling_group" "ASG-back" {
  name              = "ASG_${var.project_name}"
  max_size          = 3
  min_size          = 0
  desired_capacity  = 0

  load_balancers = ["${aws_elb.ELBBack.name}"]

  launch_configuration = "${aws_launch_configuration.L_C_back.name}"
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
