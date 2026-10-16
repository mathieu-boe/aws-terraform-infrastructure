resource "aws_security_group" "api" {
  name        = "${var.environment}-api-sg"
  description = "Security group for the operations API EC2 instance."
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTP for initial API testing."
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
  }

  egress {
    description = "Allow outbound IPv4 traffic."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-api-sg"
    Environment = var.environment
  }
}
