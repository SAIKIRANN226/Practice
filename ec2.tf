resource "aws_instance" "web" {
  ami = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"
  tags = {
    Name = "Saikiran_instance"
  }
}

provider "local-exec" {
  command = "echo The Public_ip of the Server is : ${self.public_ip}"
}