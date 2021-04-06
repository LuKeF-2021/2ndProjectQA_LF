data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "projectvpc" {
  cidr_block = var.vpc-cidr-block
  instance_tenancy = "default"

  tags = {
    Name = "${var.name} vpc"
  }
}

resource "aws_internet_gateway" "projectgw" {
  vpc_id = aws_vpc.projectvpc.id
  tags = {
    Name = "${var.name} igw"
    project = "myProject"
  }
}

resource "aws_subnet" "sub1" {
  cidr_block = var.subnet1-block
  availability_zone = data.aws_availability_zones.available.names[0]
  vpc_id = aws_vpc.projectvpc.id
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name} public subnet"
    project = "myProject"
  }
}

resource "aws_subnet" "sub2" {
  cidr_block = var.subnet2-block
  availability_zone = data.aws_availability_zones.available.names[1]
  vpc_id = aws_vpc.projectvpc.id
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name} private subnet"
    project = "myProject"
  }
}


resource "aws_route_table" "routeProject" {
  vpc_id = aws_vpc.projectvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.projectgw.id
  }

  tags = {
    project = "myProject"
  }
}

resource "aws_route_table_association" "route1" {
  subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.routeProject.id
}

resource "aws_route_table_association" "route2" {
  subnet_id = aws_subnet.sub2.id
  route_table_id = aws_route_table.routeProject.id
}

