terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws"{
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = {
      Environment = "DEV"
      Name        = "Provider Tag"
    }
  }
}

#create an ec2 instance
resource "aws_instance" "my-first-instance" {
    ami = "ami-0d81306eddc614a45"
    instance_type = "t2.micro"
}

#create an elastic ip
resource "aws_eip" "lb" {
  instance = aws_instance.my-first-instance.id
  vpc      = true
  
}

#create a s3 bucket
resource "aws_s3_bucket" "mybucket" {
    bucket = "my-tf-first-bucket0001"

    tags = {
        Name        = "My s3 bucket"
        Environment = "DEV"
    }
}

#output eip attributes
output "eip" {
    value = [aws_eip.lb.public_ip]
}

#output s3 bucket attributes
output "bucket"{
    value = [aws_s3_bucket.mybucket.arn, aws_s3_bucket.mybucket.id,aws_s3_bucket.mybucket.tags_all]
}

# output values
# bucket = [
#   "arn:aws:s3:::my-tf-first-bucket0001",
#   "my-tf-first-bucket0001",
#   tomap({
#     "Environment" = "DEV"
#     "Name" = "My s3 bucket"
#   }),
# ]
# eip = [
#   "3.109.17.95",
# ]