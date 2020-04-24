resource "aws_launch_configuration" "L_C_front" {
  name_prefix     = "${var.project_name}"
  image_id        = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.ssh_jenkis_ansible.id}",
  "${aws_security_group.ssh_ip.id}","${aws_security_group.node_Frontport.id}"]
  key_name        = "DevopsDiegoKey"
  user_data       = "${file("user-data.txt")}"
  lifecycle {
    create_before_destroy = true
  }
}