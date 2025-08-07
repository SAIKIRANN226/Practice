variable "ami_id" {
  type = string
  default = "ami-0b4f379183e5706b9"
}

variable "instance_names" {
  type = list 
  default = ["web", "mongodb"]
}

variable "name" {
  type = string 
  default = "SG_forsaikiran"
}

variable "description" {
  type = string
  default = "Allowing all as of now"
}

variable "cidr_blocks" {
  type = list 
  default = ["0.0.0.0/0"]
}

variable "tags" {
  type = map 
  default = {
    Name = "Saikiran_instance"
    Component = "web"
    Environment = "Dev"
    Project = "Roboshop"
    Terraform = "true"
  }
}