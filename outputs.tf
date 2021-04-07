output "proddb-endpoint" {
  value = module.RDS_instances.prod_RDS_Endpoint
}

output "testdb-endpoint" {
  value = module.RDS_instances.test_RDS_Endpoint
}
