resource "aws_security_group" "saikiran" {
	name = var.name
	description = var.description 
	
	ingress {
		description = "Allowing internet"
		from_port = 0
		to_port = 0
		protocol = "tcp"
		cidr_blocks = var.cidr_blocks
	}
	
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = var.cidr_blocks
	}
}
