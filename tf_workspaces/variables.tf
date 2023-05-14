#TF_VARS_access_key
variable "access_key" {  
}

#TF_VARS_secret_key
variable "secret_key" {  
}

variable "region"{
    type = string
    default = "ap-south-1"
}

variable "instance_type" {
  type = map
  default = {
    default = "t2.abc"
    dev     = "t2.micro"
    prod     = "t2.large"
  }
}