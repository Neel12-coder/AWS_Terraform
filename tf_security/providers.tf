provider "aws"{
    region = "us-west-1"
}

# provider "aws"{
#     region = "ap-south-1"
# }

/*
 Error: Duplicate provider configuration
│
│   on providers.tf line 5:
│    5: provider "aws"{
│
│ A default (non-aliased) provider configuration for "aws" was already given at providers.tf:1,1-15. If multiple configurations are required, set the
│ "alias" argument for alternative configurations.

*/

#for multiple provider configuration we use alis
provider "aws"{
    alias = "mumbai"
    region = "ap-south-1"
}

# provider "vault"
# {
#     address = ""
# }

# data "vault_generic_secrets" "secrets"
# {
#     path = ""
# }