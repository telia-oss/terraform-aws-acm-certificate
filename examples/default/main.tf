terraform {
  required_version = ">= 0.14"
}

provider "aws" {
  region = "eu-west-1"
}

module "certificate" {
  source           = "../../"
  hosted_zone_name = "<route53-zone-name>"
  certificate_name = "default-test.<route53-zone-name>"

  tags = {
    environment = "dev"
    terraform   = "True"
  }
}

output "certificate_arn" {
  value = module.certificate.arn
}
