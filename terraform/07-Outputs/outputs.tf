provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_instance" "frontend" {
  ami                   = "ami-0f93b5fd8f220e428"
  instance_type         = "t2.micro"
}

resource "aws_instance" "backend" {
  count                 = 2
  ami                   = "ami-0f93b5fd8f220e428"
  instance_type         = "t2.micro"
}

output "frontend_ip" {
  value = "${aws_instance.frontend.public_ip}"
}

output "backend_ips" {
  value = "${list ("${aws_instance.backend.*.public_ip}" ,"${aws_instance.backend.*.public_dns}")}"
}
