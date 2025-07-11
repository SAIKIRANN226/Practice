variable "ami_id" {
  type = string 
  default = "ami-0b4f379183e5706b9"
}

variable "instance_name" {
  type = string 
  default = "t3.small"
}

variable "tags" {
  type = map 
  default = {
    Name = "Msk_isntance"
    Component = "web"
    Terraform = "true"
    Environment = "dev"
    Project = "roboshop"
  }
}

variable "cidr_blocks" {
  type = list 
  default = ["0.0.0.0/0"]
}