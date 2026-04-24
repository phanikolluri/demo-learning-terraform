provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "main" {
  name = "new-sg"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

data "aws_ami" "ami" {
   most_recent = true
  owners = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
}

resource "aws_instance" "main" {
  ami           =  data.aws_ami.ami.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "web-server"
  }
}