provider "aws" {
  region = "eu-west-1"
}

module "certificate" {
  source  = "../"
  domain  = "example.com"
  zone_id = "D34D8E3F1733AA"

  tags {
    environment = "dev"
    terraform   = "True"
  }
}

output "certificate_arn" {
  value = "${module.certificate.arn}"
}
