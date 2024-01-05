resource "aws_instance" "web" {
  ami                    = var.instance_ami
  instance_type          = var.type_instance
  vpc_security_group_ids = [aws_security_group.sg_ssh.id, aws_security_group.sg_http.id]
  //user_data              = file("app_install.sh")
  subnet_id              = var.subnet_id
  key_name               = var.key_name      
  user_data              = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install git -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF 
  /*     

  */
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "sg_ssh" {
  name   = "sg_ssh"
  vpc_id = var.vpc_id

  ingress {
    description = "port 22 for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "port 22 for ssh"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "allow-ssh"
  }
}



resource "aws_security_group" "sg_http" {
  name   = "sg_http"
  vpc_id = var.vpc_id
  ingress {
    description = "port 22 for ssh"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "port 22 for ssh"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "allow-http"
  }
}
