variable "subaccount_id" {
  type        = string
  description = "The ID of the SAP BTP subaccount."
}

variable "build_code_admins" {
  type        = list(string)
  description = "List of user that should be assigned admins for SAP Build Code (format: email)."
}

variable "build_code_developers" {
  type        = list(string)
  description = "List of user that should be assigned developers for SAP Build Code (format: email)."
}

variable "application_studio_admins" {
  type        = list(string)
  description = "List of user that should be assigned admins for SAP Business Application Studio (format: email)"
}

variable "application_studio_developers" {
  type        = list(string)
  description = "List of user that should be assigned developers for SAP Business Application Studio (format: email)"
}

variable "application_studio_extension_deployer" {
  type        = list(string)
  description = "List of user that should be assigned extension deployers for SAP Business Application Studio (format: email)"
}
