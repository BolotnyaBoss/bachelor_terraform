# docs/modules/resource-group/README.md

## Overview
The `resource-group` folder contains the configuration files for managing Azure resource groups using Terraform. This folder plays a crucial role in defining and managing the infrastructure components of a software project that relies on Azure cloud services.

## Usage
To use the `resource-group` module in your project, follow these steps:
1. Ensure that Terraform (version >= x.x.x) is installed on your machine.
2. Install Azure CLI (version >= x.x.x) for interacting with Azure resources.
3. Clone or download the `resource-group` folder to your project directory.
4. Update the variables in the `variables.tf.md` file according to your project requirements.
5. Run `terraform init` to initialize the Terraform configuration.
6. Run `terraform plan` to review the changes that will be applied to the Azure resource group.
7. Run `terraform apply` to create or update the Azure resource group based on the configuration.

## Useful details
- The `main.tf.md` file defines and manages the Azure resource group using the `azurerm_resource_group` resource.
- The `outputs.tf.md` file declares the outputs of the `resource-group` module, making them accessible to other parts of the infrastructure or to users of the module.
- Ensure that you have the necessary permissions and credentials to create and manage Azure resources.
- For more information on Terraform and Azure resource groups, refer to the official documentation.