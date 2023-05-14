terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=3.0.0"
    }
  }
}

provider "aws" {
    region     = var.region[0]
    access_key = var.access_key
    secret_key = var.secret_key
}


resource "aws_instance" "my-first-instance"{
    count = var.dev_res ? 1 : 0
    ami = lookup(var.ami,var.region[count.index])
    instance_type = "t2.micro"
    tags = local.common_tags
}

output "timestamp" {
  value = local.time
}

locals{
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    common_tags = {
        dev_name = "AWS_Developer_Acct"
        organization = "ABC"
    }
}

