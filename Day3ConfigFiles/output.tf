output "instanceid" {
    value = aws_instance.name.id

  
}
output "subnet" {
    value = aws_instance.name.vpc_security_group_ids
  
}
output "instance_type" {
  
  value = aws_instance.name.instance_type
}
output "availabitiyzone" {
    value = aws_instance.name.availability_zone
  
}
output "tags" {
  value = aws_instance.name.tags_all
}