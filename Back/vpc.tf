resource "aws_vpc" "movies" {
  cidr_block = "10.2.0.0/16"
  tags = {
    responsible = "dcarvajalc"
    project     = "dcarvajalc-rampup"
    Name        = "MoviesVPC-terraform"
  }
}

resource "aws_internet_gateway" "MovieiGW" {
  vpc_id = "${aws_vpc.movies.id}"
  tags = {
    Name = "TF internet Gateway"
  }
}

resource "aws_subnet" "Pub_subnet" {
  vpc_id                  = "${aws_vpc.movies.id}"
  cidr_block              = "10.2.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Tf Public Subnet"
  }
}

resource "aws_subnet" "Priv_subnet" {
  vpc_id                  = "${aws_vpc.movies.id}"
  cidr_block              = "10.2.2.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Tf Private Subnet"
  }
}

resource "aws_subnet" "Priv_subnet_TEST" {
  vpc_id                  = "${aws_vpc.movies.id}"
  cidr_block              = "10.2.3.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Tf Private Subnet test"
  }
}

resource "aws_route_table" "Internet_RT" {
  vpc_id = "${aws_vpc.movies.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.MovieiGW.id}"
  }
  tags = {
    Name = "TF PublicRouteTable"
  }
}

resource "aws_route_table_association" "Public_association" {
  subnet_id      = "${aws_subnet.Pub_subnet.id}"
  route_table_id = "${aws_route_table.Internet_RT.id}"
}

resource "aws_eip" "eipNATGW" {
  vpc      = true
  tags = {
    Name = "eip NAT gateway"
  }
}

resource "aws_nat_gateway" "MovieNatGW" {
  allocation_id = "${aws_eip.eipNATGW.id}"
  subnet_id     = "${aws_subnet.Pub_subnet.id}"

  tags = {
    Name = "TF NAT gateway"
  }
}

resource "aws_route_table" "NAT_RT" {
  vpc_id = "${aws_vpc.movies.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.MovieNatGW.id}"
  }
  tags = {
    Name = "TF NatRouteTable"
  }
}
resource "aws_route_table_association" "Nat_association" {
  subnet_id      = "${aws_subnet.Priv_subnet.id}"
  route_table_id = "${aws_route_table.NAT_RT.id}"
}

resource "aws_route_table_association" "Nat_association_TEST" {
  subnet_id      = "${aws_subnet.Priv_subnet_TEST.id}"
  route_table_id = "${aws_route_table.NAT_RT.id}"
}