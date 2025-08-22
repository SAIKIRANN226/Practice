module "saikiran" {
    source = "../ec2-module"
    instance_type = "t3.small"
    tags = var.tags 
}