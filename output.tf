output "availability_zones" {
  value = data.aws_availability_zones.azs.names
}