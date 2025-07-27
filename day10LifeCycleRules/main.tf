resource "aws_instance" "name" {
    ami = "ami-0cbbe2c6a1bb2ad6553"
    instance_type = "t2.micro"
    #key_name = "test"
    tags = {
      Name = "test"
    }
    

  lifecycle {
    create_before_destroy = true
  }
#   lifecycle {
#     ignore_changes = [ tags, ]
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
}