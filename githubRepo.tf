
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
    }
  }
}

provider "github" {
    token = "${var.github_token}"
}

resource "github_repository" "example" {
  name        = "${var.github_repo_name}"
  description = "This is an example repository created by Terraform."
  visibility = "public"
}