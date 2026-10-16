variable "aws_region" {
  description = "AWS region in which to provision infrastructure."
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "vpc_cidr" {
  description = "CIDR block for the project VPC."
  type        = string
  default     = "10.0.0.0/27"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "The vpc_cidr variable must be a valid IPv4 CIDR block."
  }
}

variable "allowed_http_cidr" {
  description = "Public IPv4 CIDR allowed to access the API over HTTP."
  type        = string
  default     = "2.120.145.46/32"

  validation {
    condition     = can(cidrhost(var.allowed_http_cidr, 0))
    error_message = "allowed_http_cidr must be a valid IPv4 CIDR block."
  }
}
