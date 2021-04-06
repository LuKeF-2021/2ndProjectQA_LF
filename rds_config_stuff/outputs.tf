output "test_RDS_Endpoint" {
  value = aws_db_instance.test.endpoint
}

output "prod_RDS_Endpoint" {
  value = aws_db_instance.prod.endpoint
}
