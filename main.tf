provider "aws" {
  region = var.AWS_REGION
  shared_credentials_file = "~/.aws/credentials"
}

module "aws_vpc" {
  source = "./vpc_config_stuff"
}

module "security_group" {
  source = "./sg_config_stuff"
  vpc_id_projectsg = module.aws_vpc.vpc_id
}

module "ec2_instances" {
  source = "./ec2_config_stuff"
  subnet_public_id = module.aws_vpc.subnet1_id
  subnet_private_id = module.aws_vpc.subnet2_id
  vpc_security_group_Jenkins = [module.security_group.aws_sg_jenkins_id]
  vpc_security_group_testvm = [module.security_group.aws_sg_testvm_id]
}

module "RDS_instances" {
  username = var.username
  password = var.password
  source = "./rds_config_stuff"
  subnet1_id = module.aws_vpc.subnet1_id
  subnet2_id = module.aws_vpc.subnet2_id
  vpc_security_group_ids = [module.security_group.aws_sg_testvm_id]
}
