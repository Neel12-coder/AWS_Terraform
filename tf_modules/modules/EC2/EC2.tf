resource "aws_instance" "myec2" {
   ami = "ami-0c768662cc797cd75"
   instance_type = local.inst_type
}

/* if you do not want user to change your variables
then define here in locals */

locals {
    inst_type = "t2.micro"
}

output "ec2_output" {
  value = aws_instance.myec2.private_ip
}