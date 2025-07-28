resource "aws_instance" "name" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
    count = 3
    tags = {
      Name ="dev-${count.index}"
    }

   
}
variable "env" {
    type = list(string)
    default = [ "dev","test","prod" ]
  
}
resource "aws_instance" "name2" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
    count = length(var.env)
    tags = {
      Name =var.env[count.index]
    }

   
}