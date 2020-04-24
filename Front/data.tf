
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


data "aws_vpc" "Movies_vpc" {
  cidr_block = "10.2.0.0/16"
}

data "aws_subnet" "Pub_F_subnet" {
  vpc_id = "${data.aws_vpc.Movies_vpc.id}"
  filter {
    name   = "tag:Name"
    values = ["Tf Public Subnet"]
  }
}
