output "aws_sg_jenkins_id" {
  value = aws_security_group.sgProjectPublic.id
}

output "aws_sg_testvm_id" {
  value = aws_security_group.sgProjectPrivate.id
}
