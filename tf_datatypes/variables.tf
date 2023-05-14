#TF_VARS_access_key
variable "access_key" {  
}

#TF_VARS_secret_key
variable "secret_key" {  
}

variable "dev_res"{
    type = bool
}

variable "region"{
    type = list
    default = ["ap-south-1","us-west-1"]
}

variable "ec2_name" {  
    type = number
}

variable "instance_type"{
    type = string
    default = "t2.micro"
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0d81306eddc614a45"
  }
}

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201]
}



