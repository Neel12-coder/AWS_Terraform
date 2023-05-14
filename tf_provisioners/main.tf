terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=3.0.0"
    }
  }
}

provider "aws" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

#create security group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create an ec2 instance

resource "aws_instance" "myec2" {
   ami = "ami-0c768662cc797cd75"
   instance_type = "t2.micro"
   key_name = "terraform-key"
   vpc_security_group_ids = [aws_security_group.allow_ssh.id]
   tags = local.common_tags

   connection {
   type     = "ssh"
   user     = "ec2-user"
   private_key = file("./terraform-key.pem")
   host     = self.public_ip
    }

#remote exec -on creation time
 provisioner "remote-exec" {
# on_failure = continue
   inline = [
    "sudo yum -y install nano"
   ]
 }

#on destroy remove from resource
 provisioner "remote-exec" {
       when    = destroy
       inline = [
         "sudo yum -y remove nano"
       ]
     }

#local provisioner
 provisioner "local-exec" {
   command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
 }
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