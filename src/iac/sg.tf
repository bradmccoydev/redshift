resource "aws_security_group" "vpc-sg" {
  name        = "vpc-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.default.id
ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["111.220.162.153/32","220.245.209.67/32","103.105.168.225/32","116.255.10.79/32","49.195.115.141/32","220.253.1.204/32"]
  }
tags = var.tags
}