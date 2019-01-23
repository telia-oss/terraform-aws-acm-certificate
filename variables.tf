# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "domain" {
  description = "The hosted zone/domian name"
}

variable "host" {
  description = "The specific host to create a certificate for. (the name before the first .)"
}

variable "create_wildcard" {
  description = "If set to \"true\" also creates a wildcard certificate for the domain"
  default     = "false"
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = "map"
  default     = {}
}

variable "wait_for_validation" {
  description = "If set to \"false\" this module will not wait for the validation to complete and will not return the certificate ARN"
  default     = "true"
}
