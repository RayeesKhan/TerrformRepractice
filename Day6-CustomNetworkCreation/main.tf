resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="VPC1"
    }
  
}
resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "Subnet1"
    }

}
resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"

    tags = {
      Name = "Subnet2"
    }

}
resource "aws_internet_gateway" "IG" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name ="My IG"
    }
  
}
resource "aws_route_table" "MyRoute" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IG.id
    }
    tags = {
        Name="My Route"
    }
  
}
resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.MyRoute.id
    subnet_id = aws_subnet.subnet1.id
    
  
}
resource "aws_route_table_association" "name1" {
    route_table_id = aws_route_table.MyRoute.id
    subnet_id = aws_subnet.subnet2.id
    
  
}
resource "aws_security_group" "name" {
  
  vpc_id = aws_vpc.name.id
  tags = {
    Name ="MySG"
  }
ingress {
    description = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
egress {
    description = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}
}
resource "aws_instance" "name" {
    ami = "ami-0cbbe2c6a1bb2ad63"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.name.id]
    subnet_id = aws_subnet.subnet1.id
  
}