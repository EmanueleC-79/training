#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-a1447cc7
#
# Your subnet ID is:
#
#     subnet-3e826e59
#
# Your security group ID is:
#
#     sg-882a83f1
#
# Your Identity is:
#
#     Hashicorp-training-catfish
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "eu-west-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resourc "aws_instance" "web" {
  ami                    = "ami-a1447cc7"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-3e826e59"
  vpc_security_group_ids = ["sg-882a83f1"]
  count                  = "1"

  tags {
    Identity = "Hashicorp-training-catfish"
    Owner    = "Emanuele"
    Company  = "AAM"
  }
}

output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}
