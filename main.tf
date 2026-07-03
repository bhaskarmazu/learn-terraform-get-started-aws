provider "aws" {
  region = "us-east-1"
  profile = "bhaskarlabs"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical, The "owner" is the AWS account ID that published the AMI
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  # instance_type = "t2.micro"
  instance_type = var.instance_type
  
  tags = {
    # Name = "learn-terraform"
    Name = var.instance_name
      }
}
