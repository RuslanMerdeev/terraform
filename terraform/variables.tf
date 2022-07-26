variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "aws_ami" {
  description = "AMI image ID"
  type = string
}

variable instance_type {
  description = "Type of EC2 instance to use"
  type = string
  default = "t2.micro"
}