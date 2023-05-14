#TF_VARS_access_key
variable "access_key" {  
}

#TF_VARS_secret_key
variable "secret_key" {  
}

variable "region"{
    default = "ap-south-1"
}

variable "ami"{
    default = "ami-0d81306eddc614a45"
}

variable "instance_type"{
    default = "t2.micro"
}

