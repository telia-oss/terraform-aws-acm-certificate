# ------------------------------------------------------------------------------
# Resource
# ------------------------------------------------------------------------------
resource "aws_acm_certificate" "main" {
  domain_name       = var.certificate_name
  validation_method = "DNS"
  tags              = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  test = var.create_wildcard == true ? 1 : 0
}

data "aws_route53_zone" "main" {
  name = var.hosted_zone_name
}

resource "aws_acm_certificate" "wildcard" {
  count             = var.create_wildcard == true ? 1 : 0
  domain_name       = "*.${var.certificate_name}"
  validation_method = "DNS"
  tags              = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  zone_id = data.aws_route53_zone.main.id
  name    = tolist(aws_acm_certificate.main.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.main.domain_validation_options)[0].resource_record_type
  ttl     = 60

  records = [
    tolist(aws_acm_certificate.main.domain_validation_options)[0].resource_record_value,
  ]
}

resource "aws_acm_certificate_validation" "main" {
  count           = var.wait_for_validation == true ? 1 : 0
  certificate_arn = aws_acm_certificate.main.arn

  validation_record_fqdns = [
    aws_route53_record.cert_validation.fqdn,
  ]
}

resource "aws_acm_certificate_validation" "wildcard" {
  count           = var.create_wildcard == true && var.wait_for_validation == true ? 1 : 0
  certificate_arn = aws_acm_certificate.wildcard[0].arn

  validation_record_fqdns = [
    aws_route53_record.cert_validation.fqdn,
  ]
}

