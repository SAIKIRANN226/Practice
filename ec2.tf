resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.mass_SG.id]
  tags = {
    Name = "Anushka-instance"
    Project = "anushka_shetty_project"
    Component = "web"
    Environment = "dev"
    Terraform = "true"
  }
}