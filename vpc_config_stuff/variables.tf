variable "vpc_id" {
  type = string
  default = "vpc-terraform-project"
}

variable "name" {
  type = string
  default = "lukeProject"
}

variable "subnet1-block" {
  description = "cidr sub1"
  type = string
  default = "12.0.1.0/24"
}

variable "subnet2-block" {
  description = "cidr sub2"
  type = string
  default = "12.0.2.0/24"
}

variable "vpc-cidr-block" {
  description = "cidr VPC"
  type = string
  default = "12.0.0.0/16"
}

