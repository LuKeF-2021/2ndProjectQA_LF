variable "ubuntu_ami" {
  default = "ami-096cb92bb3580c759"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  default = "null"
}

variable "vpc_security_group_ids" {
  default = "null"
}
