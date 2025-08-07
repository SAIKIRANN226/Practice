resource "aws_instance" "web" {
	ami = var.ami_id
	instance_type = var.instance_names == "web" ? "t2.micro" : "t3.small"
	vpc_security_group_ids = [ aws_security_group.saikiran.id ]
	tags = var.tags
}