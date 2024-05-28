# /docs/modules/data-factory/README.md

## Overview
The `data-factory` folder contains the necessary code and configuration files for creating and provisioning Azure resources using Terraform. It plays a crucial role in a software project that requires the use of Azure Data Factory and Azure Blob Storage.

## Usage
To use the `data-factory` module in your project, follow these steps:

1. Clone the repository and navigate to the `data-factory` folder.
2. Ensure that you have Terraform installed on your machine.
3. Open the `variables.tf` file and modify the values of the variables according to your project requirements.
4. Run `terraform init` to initialize the working directory.
5. Run `terraform plan` to see the execution plan and verify that all the resources will be created correctly.
6. Run `terraform apply` to create the Azure resources defined in the `main.tf` file.
7. Once the resources are provisioned, you can utilize Azure Data Factory and Azure Blob Storage within your project.

## Useful details
- The `main.tf` file contains the Terraform configuration code for creating an Azure Storage Account, an Azure Data Factory, and a linked service for Azure Blob Storage. This file is responsible for provisioning the necessary resources for your project.
- The `variables.tf` file contains a set of variables that can be used to define and configure various aspects of your project, such as the resource group name, location, data factory name, storage account name, and linked service name. Modify these variables to suit your specific requirements.