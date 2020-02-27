resource "aws_launch_configuration" "web" {
  name_prefix     = "${var.project_name}"
  image_id        = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.allow_all.id}"]
  key_name        = "${aws_key_pair.Terraforkeypair.key_name}"
  user_data       = "${file("user-data.txt")}"
  lifecycle {
    create_before_destroy = true
  }
}