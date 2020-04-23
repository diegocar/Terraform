resource "aws_security_group" "allow_all" {
  name        = "${var.project_name}-allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.movies.id}"
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

resource "aws_security_group" "ssh_ip" {
  name        = "${var.project_name}-ssh_ip"
  description = "Allow only my ip connection"
  vpc_id      = "${aws_vpc.movies.id}"
  tags        = var.instance_tags

  ingress {    
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["190.131.198.250/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ssh_jenkis_ansible" {
  name        = "${var.project_name}-ssh_ip_jenkins"
  description = "Allow only jenkis ip connection"
  vpc_id      = "${aws_vpc.movies.id}"
  tags        = var.instance_tags

  ingress {    
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["3.22.100.120/32"]
  }

  ingress {    
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["3.133.99.102/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "node_port" {
  name        = "${var.project_name}-node_port"
  description = "Allow only port 3000 for the api"
  vpc_id      = "${aws_vpc.movies.id}"
  tags        = var.instance_tags

  ingress {    
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {    
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}