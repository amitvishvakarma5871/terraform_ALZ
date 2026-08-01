provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "backend-rg"
    storage_account_name = "storageofbackend"
    container_name       = "mycontainer"
    key                  = "mycontainer.tfstate"
  }
}