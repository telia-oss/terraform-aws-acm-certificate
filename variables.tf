# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "hosted_zone_name" {
  description = "The hosted zone"
  type        = string
}

variable "domain_name" {
  description = "The certificate you are requesting (must be valid for the hosted zone)"
  type        = string
}

variable "subject_alternative_names" {
  description = "(Optional) Set of domains that should be SANs in the issued certificate."
  type        = list(string)
  default     = []
}

variable "create_wildcard" {
  description = "If set to \"true\" also creates a wildcard certificate for the domain/subdomain"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "wait_for_validation" {
  description = "If set to false this module will not wait for the validation to complete and will not return the certificate ARN"
  type        = bool
  default     = true
}

