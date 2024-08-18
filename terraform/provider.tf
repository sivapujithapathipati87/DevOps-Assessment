provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "other"
  region = "us-east-1"  # Example for multiple regions
}
