# resource "aws_eip" "eip" {
#    instance = aws_instance.public_instance.id
#    vpc      = true
#    tags = {
#      Name = "elastic-ip"
#    }
# }