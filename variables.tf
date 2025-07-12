variable "common_tags" {
    type = map 
    default = {
        Component = "web"
        Terraform = "true"
        Project = "roboshop"
    }
}

variable "vpc_tags" {
  type = map 
  default = {
    Name = "${Project}-VPC"
  }
}

variable "igw_tags" {
  type = map 
  default = {
    Name = "${Project}-IGW"
  }
}

variable "public_subnets_tags" {
  type = map 
  default = {
    Name = "${Project}-Public_subnets"
  }
}

variable "public_subnets_cidr" {
  type = list 
  validation {
    condition = (var.private_subnets_cidr) == 2
    error_message = "Please provide the 2 valid subnets"
  }
}