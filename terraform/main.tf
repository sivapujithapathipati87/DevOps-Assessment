module "ecr" {
  source = "./ecr.tf"
}

module "cluster" {
  source = "./cluster.tf"
}

module "service" {
  source = "./service.tf"
}

module "autoscaling" {
  source = "./autoscaling.tf"
}

module "secrets-manager" {
  source = "./secrets-manager.tf"
}
