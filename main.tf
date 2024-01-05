resource "aws_instance" "web" {
  ami                    = var.instance_ami
  instance_type          = var.type_instance
 /*   user_data              = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install git -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF 
     

  */
  tags = {
    Name = "HelloWorld"
  }
}
