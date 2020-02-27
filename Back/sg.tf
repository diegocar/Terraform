resource "aws_security_group" "allow_all" {
  name        = "${var.project_name}-allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${data.aws_vpc.selected.id}"
  tags        = var.instance_tags

  ingress {    
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}