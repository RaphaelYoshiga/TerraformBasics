provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}


variable "resource_group_name" {
  type        = string
}

variable "app_insights_name" {
  type        = string
}

resource "azurerm_resource_group" "group" {
  name     = var.resource_group_name
  location = "West Europe"
}

resource "azurerm_application_insights" "example" {
  name                = var.app_insights_name
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  application_type    = "web"
  retention_in_days   = 120
}
