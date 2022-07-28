variable "cidr" {
  type = list
  default = ["192.168.1.0/24","192.168.2.0/24"]
}

variable "az" {
  type = list
  default = ["ap-south-1a","ap-south-1b"]
}
