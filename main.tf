/*
provider "aws" {
  region = "eu-central-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}
*/
  
resource "github_actions_secret" "access_key" {
  repository       = "atlantis-test"
  secret_name      = "AWS_ACCESS_KEY"
  sensitive        = true
  #plaintext_value  = var.some_secret_string
}

resource "github_actions_secret" "secret_key" {
  repository       = "atlantis-test"
  secret_name      = "AWS_SECRET_KEY"
  sensitive        = true
  #plaintext_value  = var.some_secret_string
}

output "secret" {
  value = "${github_actions_secret.secret_key}"
}

output "access" {
  value = "${github_actions_secret.access_key}"
}

/*  
provider "aws" {
  region = "eu-central-1"
  access_key = "${github_actions_secret.access_key}"
  secret_key = "${github_actions_secret.secret_key}"
  
}
 
resource "aws_instance" "Public_EC2" {
    ami = "ami-0a261c0e5f51090b1"
    availability_zone = "eu-central-1a"
    instance_type               = "t2.micro"
    associate_public_ip_address = true

    tags = {
    Name = "Ec2-with-atlantis"
  }
}
*/
 
