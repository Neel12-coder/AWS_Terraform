terraform {
  backend "s3" {
    bucket = "my-tf-backend-bkt123"
    key    = "gfr/terraform.tfstate"
    dynamodb_table = "terraform-state-locking"
    region = "ap-south-1"
  }
}

resource "time_sleep" "wait_150_seconds" {

  create_duration = "150s"
}