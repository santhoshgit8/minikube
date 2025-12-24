provider "aws" {
  region = "us-west-1"
}

resource "aws_security_group" "sg" {
  name = "argocd-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "argocd" {
  ami                    = "ami-0623300d1b7caee89"
  instance_type          = "t3.large"             
  key_name               = "Argocd"
  security_groups        = [aws_security_group.sg.name]

  user_data = file("minikube.sh")

  tags = {
    Name = "ArogCD"
  }
}

output "public_ip" {
  value = aws_instance.argocd.public_ip
}

