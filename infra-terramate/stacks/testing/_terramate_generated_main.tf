// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "random_uuid" "uuid" {
}
locals {
  subaccount_domain = lower(replace("TST-${var.subaccount_domain_prefix}-${random_uuid.uuid.result}", "_", "-"))
  subaccount_labels = {
    "stage" = toset([
      "TST",
    ])
  }
}
resource "btp_subaccount" "sa_build" {
  labels    = local.subaccount_labels
  name      = var.subaccount_name
  region    = lower(var.region)
  subdomain = local.subaccount_domain
}
module "build_code" {
  application_studio_admins             = var.build_code_admins
  application_studio_developers         = var.build_code_developers
  application_studio_extension_deployer = var.build_code_developers
  build_code_admins                     = var.build_code_admins
  build_code_developers                 = var.build_code_developers
  count                                 = "0"
  source                                = "../../modules/build_code/"
  subaccount_id                         = btp_subaccount.sa_build.id
}
