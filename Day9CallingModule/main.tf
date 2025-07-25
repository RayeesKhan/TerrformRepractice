module "ec2module" {
    source = "../Day9ModuleTemplate"
ami_id = "ami-0cbbe2c6a1bb2ad63"
instance_type = "t2.micro"
tags ={
    Name = "Dev"
    CostCenter = "1020"
}
}