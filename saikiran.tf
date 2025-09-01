resource "aws_instance "web" {
  ami = "ami-0b4f379183e5706b9"
  instance_type = "t2.small"
  vpc_security_group_ids = [ aws_security_group_id.saikiran.id ]
}