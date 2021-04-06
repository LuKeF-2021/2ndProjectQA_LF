resource "aws_instance" "ec2-jenkins" {
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  key_name = "Luke-AWS"
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = true
}

resource "aws_instance" "ec2-testing" {
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  key_name = "Luke-AWS"
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = true
}
