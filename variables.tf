variable "allow_tls" {
  type = string 
  default = "allowing"
}

variable "description" {
  type = string
  default = "allowing all ports for practice"
}

variable "prefix" {
  type = string 
  default = "MSK"
}

variable "ami_id" {
  type = string 
  default = "ami-0b4f379183e5706b9"
}

variable "instance_type" {
  type = string 
  default = "t2.micro"
}