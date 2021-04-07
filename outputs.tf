output "proddb-endpoint" {
  value = module.security_group.prod_RDS_Endpoint
}

output "testdb-endpoint" {
  value = module.security_group.test_RDS_Endpoint
}
