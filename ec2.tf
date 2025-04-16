resource "aws_instance" "web" {
  ami           = var.ami-id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sai-SG.id]
  tags = {
    Name = "HelloWorld"
    Environment = "dev"
    Terraform = "true"
    Component = "web"
  }
}


resource "aws_security_group" "sai-SG" {
  name        = "simple-security-group"
  description = "Allow all traffic"

  ingress {
    description = "Allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "SimpleSecurityGroup"
  }
}