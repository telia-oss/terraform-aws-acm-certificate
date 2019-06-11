# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "hosted_zone_name" {
  description = "The hosted zone"
}

variable "certificate_name" {
  description = "The certificate you are requesting (must be valid for the hosted zone)"
}

variable "create_wildcard" {
  description = "If set to \"true\" also creates a wildcard certificate for the domain/subdomain"
  default     = "false"
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "wait_for_validation" {
  description = "If set to \"false\" this module will not wait for the validation to complete and will not return the certificate ARN"
  default     = "true"
}

