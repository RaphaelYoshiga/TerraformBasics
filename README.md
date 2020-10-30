
  

# Terraform basics

  

This repository contains an example on how to set up an Azure APIM CI/CD pipeline using Terraform.
[Blog](https://google.com)

### Running this example

1. Install terraform https://learn.hashicorp.com/tutorials/terraform/install-cli

2. Log in to Azure through the console: https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell

    az login
    az account set --subscription={id} # If you have more than one account
  

3. Initialize terraform

    terraform init

4. Change the apim_name under the main.tfvars to ensure you have a unique APIM name.

5. Run a plan to check what is going to happen

    terraform plan -var-file="main.tfvars"

6. Try to apply:

    terraform apply -var-file="main.tfvars"


**If you were setting up terraform from scratch:**

After the Terraform init:

  1. create main.tf  with:

    provider "azurerm" {    
	    version = "=2.20.0"	    
	    features {}  
    }

  

2. Creating a resource group*

    resource "azurerm_resource_group" "example" {    
        name = "tf-test"
        location = "West Europe"    
    }

    terraform init
    
    terraform plan
    
    terraform apply

  

### Adding app insights

https://www.terraform.io/docs/providers/azurerm/r/application_insights.html
  
# Next steps:

It's important to understand about the terraform states. States are the current state of what terraform thinks your Azure infrastructure looks like, it knows what to delete/create/update from it. So for collaborating with multiple people, this file should be in some sort of backend, for example Azure Storage or AWS S3.

### Store states in an azure storage
https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage


### Parameretise / Multi environment
If you are going to have to do multiple environments, you can get guidance here: 

https://codurance.com/2020/04/28/terraform-with-multiple-environments/




