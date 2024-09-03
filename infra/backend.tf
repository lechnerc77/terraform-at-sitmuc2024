terraform {
  backend "azurerm" {
    resource_group_name  = "rg_terraform_state_sapbtp"
    storage_account_name = "sasapbtptfstate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
