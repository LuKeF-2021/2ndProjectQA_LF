variable "ubuntu_ami" {
  default = "ami-096cb92bb3580c759"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_public_id" {
  default = "12.0.1.0/24"
}

variable "subnet_private_id"{
  default = "12.0.2.0/24"
}

variable "vpc_security_group_Jenkins" {
  default = "null"
}

variable "vpc_security_group_testvm" {
  default = "null"
}