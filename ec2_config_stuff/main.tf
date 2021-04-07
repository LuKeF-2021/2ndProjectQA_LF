resource "aws_instance" "ec2-jenkins" {
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  key_name = "Luke-AWS"
  subnet_id = var.subnet_public_id
  vpc_security_group_ids = var.vpc_security_group_Jenkins
  associate_public_ip_address = true

  tags = {
    name = "Jenkins VM"
  }
}

resource "aws_instance" "ec2-testing" {
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  key_name = "Luke-AWS"
  subnet_id = var.subnet_private_id
  vpc_security_group_ids = var.vpc_security_group_testvm
  associate_public_ip_address = true

  tags = {
    name = "Test VM"
  }
}
