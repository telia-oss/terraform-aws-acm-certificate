provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "main" {
  default = true
}

data "aws_subnet_ids" "main" {
  vpc_id = "${data.aws_vpc.main.id}"
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
  value = "${module.certificate.certificate_arn}"
}
