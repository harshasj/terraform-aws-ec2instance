resource "aws_instance" "web" {
  ami                    = var.instance_ami
  instance_type          = var.type_instance
  user_data              = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install git -y
    sudo apt install nginx -y
    EOF 
    
  tags = {
    Name = "HelloWorld"
  }
}

/*
resource "aws_security_group" "allow_all_traffic" {
  name        = "allow_all_traffic"
  description = "Allow all inbound traffic"

  ingress {
    description      = "all traffic "
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "all traffic "
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all_traffic"
  }
}
*/
