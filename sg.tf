resource "aws_security_group" "mass_SG" {
  name_prefix = var.prefix
  description = var.description

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "anushka_security"
  }

  timeouts {
    create = "1m"
  }
}


output "id" {
  value = aws_security_group.mass_SG.id
}

output "name" {
  value = aws_security_group.mass_SG.name
}

