provider "aws" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-backend-bkt123"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-state-locking"
  billing_mode = "PROVISIONED"
  read_capacity = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "dev"
  }
}