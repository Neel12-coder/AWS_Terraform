data "terraform_remote_state" "eip_data" {
  backend = "s3"
  config = {
    bucket = "my-tf-backend-bkt123"
    key    = "gfr/terraform.tfstate"
    region = "ap-south-1"
  }
}