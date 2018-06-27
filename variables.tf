# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "domain" {
  description = "The domain of the certificate to look up."
}

variable "zone_id" {
  description = "The ID of the hosted zone to contain this record."
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = "map"
  default     = {}
}
