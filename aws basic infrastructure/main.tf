  resource "aws_launch_configuration" "web_server_as" {
    image_id           = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_server.id]

    user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install apache2 -y
    sudo systemctl start apache2
    sudo systemctl enable apache2
    sudo systemctl restart apache2
    sudo chmod 766 /var/www/html/index.html
    sudo echo "<html><body><h1>Welcome to Terraform Scaling.</h1></body></html>" >/var/www/html/index.html    
   EOF

  }


  resource "aws_elb" "web_server_lb"{
     name = "web-server-lb"
     security_groups = [aws_security_group.web_server.id]
    #  subnets = [aws_subnet.public_subnet.id,aws_subnet.private_subnet.id]
     subnets = [aws_subnet.public_subnet.id]
     listener {
      instance_port     = 8000
      instance_protocol = "http"
      lb_port           = 80
      lb_protocol       = "http"
    }
    tags = {
      Name = "terraform-elb"
    }
  }

  resource "aws_autoscaling_group" "web_server_asg" {
    name                 = "web-server-asg"
    launch_configuration = aws_launch_configuration.web_server_as.name
    min_size             = 1
    max_size             = 3
    desired_capacity     = 2
    health_check_type    = "EC2"
    load_balancers       = [aws_elb.web_server_lb.name]
    vpc_zone_identifier  = [aws_subnet.public_subnet.id]

    tag {
    key                 = "Name"
    value               = "web-server-as"
    propagate_at_launch = true
  }
  }
