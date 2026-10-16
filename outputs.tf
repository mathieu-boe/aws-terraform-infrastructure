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
