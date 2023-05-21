"# terraform-repo" 
# Refer individual folders for code

## set env var for windows
setx TF_VAR_<varname> <varvalue>

## set env var for unix
export TF_VAR_<varname> = <varvalue>

## to download provider plugins
terraform init

## to check resources added, deleted and modified
terraform plan
terraform plan -out <file_name>.ext

## to apply changes; for auto approval use [terraform apply -auto-approval]
terraform apply
terraform apply <file_name>.ext

## to perform simple operation using terraform on console
terraform console

## to format terraform code
terraform fmt

## to destroy infrastructure
terraform destroy

## for remote backend operations
terraform state -h

## for workspaces
terraform workspace -h

## to get workspace name in code
terraform.workspace

## to import a mnually created infrastructure
terraform import
### currently only resources are imported not configuration

## terraform cloud as backend
terraform login, terraform plan, terraform apply
