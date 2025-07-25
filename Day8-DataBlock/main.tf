data "aws_subnet" "name" {
  id = "subnet-032522effeb6e7d6e"

}
data "aws_subnet" "Subent1" {
  filter {
    name   = "tag:Name"
    values = ["Subnet1"]
  }

}
resource "aws_instance" "name" {
  ami           = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.name.id
  tags = {
    Name = "Suent2 server"

  }

}
resource "aws_instance" "name1" {
  ami           = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.Subent1.id
  tags = {
    Name = "Suent1 server"

  }

}
