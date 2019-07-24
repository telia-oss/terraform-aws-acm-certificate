# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
output "arn" {
  description = "The ARN of the certificate that is being validated."
  value       = concat(aws_acm_certificate_validation.main[*].certificate_arn, [""])[0]
}

output "wildcard_arn" {
  description = "The ARN of the wildcard certificate that is being validated."
  value       = concat(aws_acm_certificate_validation.wildcard[*].certificate_arn, [""])[0]
}

