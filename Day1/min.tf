resource "aws_instance" "name" {
  
  ami = "ami-0c9fb5d338f1eec43"
  instance_type = "t3.micro"
  tags ={
    Name = "uat"
  }
  lifecycle {
    ignore_changes = [ tags ]
    
  }
}
