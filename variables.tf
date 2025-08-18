variable "ami_id" {
  type = string 
  default = "ami-0b4f379183e5706b9"
}

variable "instance_type" {
  type = string 
  default = "t2.micro"
}

variable "tags" {
  type = map 
  default = {
    Name = "Saikiran_instance"
    Project = "Roboshop"
    Environment = "Dev"
    Component = "web"
    Terraform = "true"
  }
}

variable "description" {
  type = string 
  default = "Allowing all as of now"
}

variable "cidr_blocks" {
  type = list 
  default = ["0.0.0.0/0"]
}