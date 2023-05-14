terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.18.0"
    }
  }
}

#valid only for a day
provider "github" {
  token = "" # or `GITHUB_TOKEN`
}

resource "github_repository" "terraform-repo" {
    name = "terraform-repo"
    description = "My first repository using hashicorp terraform"
    visibility = "private"
}