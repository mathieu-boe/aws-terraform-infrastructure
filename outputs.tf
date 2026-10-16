output "vpc_id" {
  description = "ID of the project VPC."
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR range configured for the VPC."
  value       = aws_vpc.main.cidr_block
}

output "dev_subnet_id" {
  description = "ID of the dev subnet."
  value       = aws_subnet.dev.id
}

output "dev_subnet_cidr" {
  description = "CIDR range of the dev subnet."
  value       = aws_subnet.dev.cidr_block
}

output "prod_subnet_id" {
  description = "ID of the prod subnet."
  value       = aws_subnet.prod.id
}

output "prod_subnet_cidr" {
  description = "CIDR range of the prod subnet."
  value       = aws_subnet.prod.cidr_block
}

output "aws_internet_gateway_id" {
  description = "ID of the VPC internet gateway"
  value       = aws_internet_gateway.main.id
}

output "dev_route_table_id" {
  description = "ID of the dev public route table"
  value       = aws_route_table.dev.id
}

output "api_security_group_id" {
  description = "ID of the security group for the operations API."
  value       = aws_security_group.api.id
}

output "api_instance_id" {
  description = "ID of the operations API EC2 instance."
  value       = aws_instance.api.id
}

output "api_public_ip" {
  description = "Public IPv4 address of the operations API instance."
  value       = aws_instance.api.public_ip
}
