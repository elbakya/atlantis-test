
provider "aws" {
  region = "eu-central-1a"
  assume_role {
    role_arn     = "arn:aws:iam::177172943105:role/FullAccessToEC2"
  }
}


data "aws_availability_zone" "example" {
  name = "eu-central-1a"
}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_ami" "latest_ubuntu" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }
}

//Creating Public EC2 Instance
resource "aws_instance" "Public_EC2" {
  ami                         = data.aws_ami.latest_ubuntu.id
  availability_zone           = data.aws_availability_zone.example.name
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  #user_data                   = file("./local-setup.sh")

  tags = {
    Name = "Ec2-with-atlantis"
  }
}
  assume_role {
    role_arn     = "arn:aws:iam::<AccountID>:role/myrole"
  }
