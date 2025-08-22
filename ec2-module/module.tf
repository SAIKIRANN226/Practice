resource "aws_instance" "saikiran" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
}