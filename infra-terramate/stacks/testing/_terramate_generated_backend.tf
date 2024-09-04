// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "azurerm" {
    container_name       = "tfstate"
    key                  = "tst.terraform.tfstate"
    resource_group_name  = "rg_terraform_state_sapbtp"
    storage_account_name = "sasapbtptfstate"
  }
}
