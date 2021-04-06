variable "vpc_id_projectsg" {
  default = "null"
}

variable "namePriv" {
  default = "Security Group for private subnet"
}

variable "namePub" {
  default = "Security Group for public subnet"
}

variable "open_internet" {
  type = string
  default = "0.0.0.0/0"
}

variable "configure_VM_CIDR" {
  type = string
  default = "18.133.243.104/32"
}

variable "outbound_port" {
  default = "0"
}

