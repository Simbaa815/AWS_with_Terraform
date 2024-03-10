# resource "aws_instance" "public_instance" {
#   ami             = "ami-0557a15b87f6559cf"
#   instance_type   = "t2.micro"
#   subnet_id       = aws_subnet.public_subnet.id
#   vpc_security_group_ids = [aws_security_group.web_server.id]
#   tags = {
#     Name = "PublicEC2Instance"
#   }
#     user_data              = <<-EOF
#     #!/bin/bash
#     sudo apt update -y
#     sudo apt install apache2 -y
#     echo "<html><body><h1>Welcome to My Website!</h1></body></html>" | sudo tee /var/www/html/index.html
#     sudo systemctl start apache2
#     sudo systemctl enable apache2
#   EOF

# }