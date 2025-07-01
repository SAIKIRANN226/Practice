resource "aws_instance" "web" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.saikiran.id]
    tags = {
        Name = "MSK_Instance"
        Environemnt = "dev"
        Terraform = "true"
        Component = "web"
    }
}


resource "aws_security_group" "saikiran" {
    name = "allo-saikiran"
    description = "allowing all as of now"

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
}