provider "aws" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}
resource "aws_eip" "lb" {
  vpc      = true
}

output "eip_addr" {
  value = aws_eip.lb.public_ip
}