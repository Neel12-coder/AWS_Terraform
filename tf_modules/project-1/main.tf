module "aws_inst"{
   source = "../modules/EC2"
}

module "security_group"{
    source = "../modules/SG"
    sec_grp_name = var.sec_grp_name
}

output "ec2_ip"{
    value = module.aws_inst.ec2_output
}