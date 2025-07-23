variable "ami_id" {
    type = string
    default = ""
    description = "ami id is being passed from variable"
  
}
variable "instancetype" {
    type = string
    description = ""
    default = "t2.micro"
  
}
variable "tags" {
    type = map(string)
    description = "tages are being called from variable"

}