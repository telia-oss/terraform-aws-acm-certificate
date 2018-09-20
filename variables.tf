# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "domain" {
  description = "The domain of the certificate to look up."
}

variable "zone_id" {
  description = "The ID of the hosted zone to contain this record."
}

variable "create_wildcard" {
  description = "If set to \"true\" also creates a wildcard certificate for the domain"
  default = "false"
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = "map"
  default     = {}
}
