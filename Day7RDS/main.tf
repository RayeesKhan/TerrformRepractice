resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  #username             = jsondecode(data.aws_secretsmanager_secret_version.secretversion.secret_string["username"])
  #password             = jsondecode(data.aws_secretsmanager_secret_version.secretversion.secret_string["password"])
  manage_master_user_password = true
  username = "admin"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.name.id
  depends_on = [aws_db_subnet_group.name]
}
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="VPC1"
    }
  
}
resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
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
resource "aws_db_subnet_group" "name" {
    name       = "dbsubnet"
  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_secretsmanager_secret" "name" {
    name = "dbsecret"
    description = "creating this secret for"
  
}
resource "aws_secretsmanager_secret_version" "secretversion" {
    secret_id = aws_secretsmanager_secret.name.id
    secret_string = jsonencode({
        host = aws_db_instance.default.address
        username="admin"
        password ="cloud123"
    })
      depends_on = [ aws_db_instance.default ]
  
}