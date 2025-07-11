resource "aws_security_group" "saikiran" {
  name = "allow-all"
  description = "allowing inbound rule from internet"

  ingress {
    description = "allowing inbound rule"
    from_port = 0 
    to_port = 0 
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port = 0
    to_port = 0 
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }

  tags = {
    Name = "SP_security"
  }
}