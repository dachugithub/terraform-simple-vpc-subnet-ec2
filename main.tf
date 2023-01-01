provider "aws" {
  region = local.region
}

locals {
  name   = "tomasz"
  region = "eu-west-2"

  tags = {
    Example    = local.name
  }
}

