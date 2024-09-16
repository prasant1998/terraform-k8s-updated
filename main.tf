provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = "10.0.0.0/16"
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source               = "./modules/eks"
  cluster_name         = "my-eks-cluster"
  cluster_role_arn     = "arn:aws:iam::123456789012:role/eks-cluster-role"  # Update with actual ARN
  node_role_arn        = "arn:aws:iam::123456789012:role/eks-node-role"  # Update with actual ARN
  subnet_ids           = module.vpc.public_subnet_ids ++ module.vpc.private_subnet_ids
  node_group_name      = "default-node-group"
  cluster_security_group_id = module.security_group.cluster_security_group_id
  node_security_group_id    = module.security_group.node_security_group_id
}
