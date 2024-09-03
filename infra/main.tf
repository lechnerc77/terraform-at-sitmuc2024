# ------------------------------------------------------------------------------------------------------
# Construct Subdomain with random UUID and prefix
# ------------------------------------------------------------------------------------------------------
resource "random_uuid" "uuid" {}

locals {
  subaccount_domain = lower(replace("${var.subaccount_domain_prefix}-${random_uuid.uuid.result}", "_", "-"))
}

# ------------------------------------------------------------------------------------------------------
# Creation of subaccount
# ------------------------------------------------------------------------------------------------------
resource "btp_subaccount" "sa_build" {
  name      = var.subaccount_name
  subdomain = local.subaccount_domain
  region    = lower(var.region)
}

# ------------------------------------------------------------------------------------------------------
# Setup of SAP Build Code via module
# ------------------------------------------------------------------------------------------------------
module "build_code" {
  source = "../modules/build_code/"

  subaccount_id = btp_subaccount.sa_build.id

  application_studio_admins             = var.build_code_admins
  application_studio_developers         = var.build_code_developers
  application_studio_extension_deployer = var.build_code_developers

  build_code_admins     = var.build_code_admins
  build_code_developers = var.build_code_developers
}
