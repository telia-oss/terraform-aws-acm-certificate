terraform {
  required_version = ">= 0.14"
}

provider "aws" {
  region = "eu-west-1"
}

module "certificate" {
  source           = "../../"
  hosted_zone_name = "<route53-zone-name>"
  domain_name      = "default-test.<route53-zone-name>"


  tags = {
    environment = "dev"
    terraform   = "True"
  }
}

module "certificate_with_sans" {
  source                    = "../../"
  hosted_zone_name          = "<route53-zone-name>"
  domain_name               = "default-test-1.<route53-zone-name>"
  subject_alternative_names = ["default-test-2.<route53-zone-name>", "default-test-3.<route53-zone-name>"]



  tags = {
    environment = "dev"
    terraform   = "True"
  }
}

output "certificate_arn" {
  value = module.certificate.arn
}

output "certificate_with_sans_arn" {
  value = module.certificate_with_sans.arn
}