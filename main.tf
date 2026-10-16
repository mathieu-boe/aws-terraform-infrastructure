resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "dev" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 1, 0)
  availability_zone = "${var.aws_region}a"

  tags = {
    Name        = "dev-subnet"
    Environment = "dev"
  }
}

resource "aws_subnet" "prod" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 1, 1)
  availability_zone = "${var.aws_region}a"

  tags = {
    Name        = "prod-subnet"
    Environment = "prod"
  }
}
