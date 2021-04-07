resource "aws_security_group" "sgProjectPublic" {
  name = var.namePub
  description = "Allow internet access to the app"
  vpc_id = var.vpc_id_projectsg

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  [var.configure_VM_CIDR]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.open_internet]
  }

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [var.vpc_range_CIDR]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [var.open_internet]
  }

  egress {
    from_port = var.outbound_port
    to_port = var.outbound_port
    protocol = "-1"
    cidr_blocks = [var.open_internet]
  }

  tags = {
    project = "myProject"
  }

}

resource "aws_security_group" "sgProjectPrivate" {
  name = var.namePriv
  description = "Allow SSH from jenkins to test environment"
  vpc_id = var.vpc_id_projectsg

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  [var.configure_VM_CIDR]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.open_internet]
  }

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [var.vpc_range_CIDR]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [var.open_internet]
  }

  egress {
    from_port = var.outbound_port
    to_port = var.outbound_port
    protocol = "-1"
    cidr_blocks = [var.open_internet]
  }

  tags = {
    project = "myProject"
  }

}


