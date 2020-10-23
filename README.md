https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell

az login

az account set --subscription={id}

create main.tf

provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "tf-test"
  location = "West Europe"
}

terraform init

terraform plan
terraform apply

add to main.tf
resource "azurerm_application_insights" "example" {
  name                = "tf-test-appinsights"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  application
  _type    = "web"
}

terraform apply

Show states
https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage

Parameretise
https://codurance.com/2020/04/28/terraform-with-multiple-environments/