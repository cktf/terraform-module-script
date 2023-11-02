variable "connection" {
  type        = any
  default     = {}
  sensitive   = false
  description = "Script Connection"
}

variable "create" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Script Create"
}

variable "destroy" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Script Destroy"
}
