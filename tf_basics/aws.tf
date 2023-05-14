provider "aws" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}


resource "aws_instance" "my-first-instance"{
    ami = "ami-0d81306eddc614a45"
    instance_type = "t2.micro"
}