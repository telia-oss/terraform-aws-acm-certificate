# ------------------------------------------------------------------------------
# Resource
# ------------------------------------------------------------------------------
resource "aws_acm_certificate" "main" {

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS"
  tags                      = var.tags

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
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"
  tags              = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for record in aws_acm_certificate.main.domain_validation_options : record.domain_name => {
      name   = record.resource_record_name
      type   = record.resource_record_type
      record = record.resource_record_value
    }
  }

  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  zone_id = data.aws_route53_zone.main.id
  ttl     = 60
}

resource "aws_acm_certificate_validation" "main" {
  count                   = var.wait_for_validation == true ? 1 : 0
  certificate_arn         = aws_acm_certificate.main.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

resource "aws_acm_certificate_validation" "wildcard" {
  count                   = var.create_wildcard == true && var.wait_for_validation == true ? 1 : 0
  certificate_arn         = aws_acm_certificate.wildcard[0].arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
