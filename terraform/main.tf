module "ecr" {
  source = "./ecr"
}

module "cluster" {
  source = "./cluster"
}

module "service" {
  source = "./service"
}

module "autoscaling" {
  source = "./autoscaling"
}

module "secrets-manager" {
  source = "./secrets-manager"
}
