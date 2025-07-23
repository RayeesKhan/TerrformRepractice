
resource "aws_instance" "name" {
  
 ami ="ami-0c9fb5d338f1eec43"
  instance_type = "t3.micro"
  tags = {
    Name = "Test2"
  }
}
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Test VPC"
  }
  
}