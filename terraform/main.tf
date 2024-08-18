module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  name        = "notification-cluster"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.public_subnets
  assign_public_ip = true
}
