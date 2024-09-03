variable "globalaccount" {
  type        = string
  description = "Subdomain of SAP BTP global account"
}

variable "subaccount_domain_prefix" {
  type        = string
  description = "The prefix used for the subaccount domain"
  default     = "sitMUC2024-TF"
}

variable "subaccount_name" {
  type        = string
  description = "The subaccount name."
  default     = "sitMUC2024-Terraform"
}

variable "region" {
  type        = string
  description = "The region of the subaccount."
  default     = "us10"
}

variable "stage" {
  type        = string
  description = "The stage of the subaccount."
  default     = "dev"
}

variable "build_code_admins" {
  type        = list(string)
  description = "List of user that should be assigned admins for SAP Build Code (format: email)."
}

variable "build_code_developers" {
  type        = list(string)
  description = "List of user that should be assigned developers for SAP Build Code (format: email)."
}
