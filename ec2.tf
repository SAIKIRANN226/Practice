resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.instance_name
    vpc_security_group_ids = [aws_security_group.saikiran.id]
    tags = var.tags 
}