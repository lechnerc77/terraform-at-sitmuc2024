// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

variable "globalaccount" {
  description = "Subdomain of SAP BTP global account"
  type        = string
}
variable "subaccount_domain_prefix" {
  default     = "sitMUC2024-TF"
  description = "The prefix used for the subaccount domain"
  type        = string
}
variable "subaccount_name" {
  default     = "sitMUC2024-Terraform"
  description = "The subaccount name."
  type        = string
}
variable "region" {
  default     = "us10"
  description = "The region of the subaccount."
  type        = string
}
variable "build_code_admins" {
  description = "List of user that should be assigned admins for SAP Build Code (format: email)."
  type        = list(string)
}
variable "build_code_developers" {
  description = "List of user that should be assigned developers for SAP Build Code (format: email)."
  type        = list(string)
}
