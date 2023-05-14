provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "myec2" {
   ami = "ami-0c768662cc797cd75"
   instance_type = lookup(var.instance_type,terraform.workspace)
}