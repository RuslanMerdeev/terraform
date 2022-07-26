provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "app" {
  ami           = var.aws_ami
  instance_type = var.instance_type
}