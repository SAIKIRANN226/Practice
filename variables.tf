variable "instance_names" {
  type = map 
  default = {
    mongodb = "t2.micro"
    web = "t2.small"
    catalogue = "t2.small"
  }
}

variable "zone_id" {
  type = string 
  default = "Z03123921NOU39UU26DXY"
}

variable "domain_name" {
  type = string 
  default = "megacitysai.fun"
}