resource "aws_instance" "name" {
  
  ami ="ami-0c9fb5d338f1eec43"
  instance_type = "t3.micro"
  tags = {
    Name = "Test"
  }
}
resource "aws_s3_bucket" "name" {
  bucket = "rk23072025sdfasffffasf"
  
}