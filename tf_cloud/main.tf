terraform {
  cloud {
    organization = "Neel_Coder"

    workspaces {
      name = "remote_backend_demo"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}