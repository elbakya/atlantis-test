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

provider "aws" {}

resource "aws_instance" "Public_EC2" {
    ami = "ami-0a261c0e5f51090b1"
    availability_zone = "eu-central-1a"
    instance_type               = "t2.micro"
    associate_public_ip_address = true

    tags = {
    Name = "Ec2-with-atlantis"
  }
}
