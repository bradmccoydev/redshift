resource "aws_security_group" "vpc-sg" {
  name        = "vpc-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.default.id
ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["49.179.161.106/32"]
  }
tags = var.tags
}