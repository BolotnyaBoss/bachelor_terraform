# docs/modules/data-factory/README.md

## Overview
The `data-factory` folder contains code written in Terraform, a tool used for infrastructure as code. The purpose of this code is to define three resources in Azure: a storage account, a data factory, and a linked service for Azure Blob Storage within the data factory. 

The `data-factory` plays a crucial role in a software project as it enables the creation and configuration of data pipelines and orchestration in Azure. It allows developers to automate and manage the movement and transformation of data, making it an essential component for data integration and data engineering tasks.

## Usage
To utilize the `data-factory` code in a project, follow these steps:
1. Ensure that you have Terraform installed on your local machine.
2. Clone the project repository and navigate to the `data-factory` folder.
3. Open the `variables.tf` file and update the values of the variables according to your specific requirements. The variables you need to modify are:
   - `storage_account_name`: The name of the existing storage account in Azure.
   - `resource_group_name`: The name of the resource group in which to create the storage account.
   - `location`: The location where the storage account will be created.
4. Save the changes to the `variables.tf` file.
5. Run the Terraform commands to initialize the project and apply the configuration. Use the following commands:
   ```shell
   terraform init
   terraform apply
   ```
6. Follow the prompts and confirm the changes to create the storage account, data factory, and linked service.

## Useful details
- The code in the `data-factory` folder is written in Terraform using the HashiCorp Configuration Language (HCL).
- The `variables.tf` file defines the variables used in the Terraform configuration. Make sure to update the values of these variables according to your requirements before applying the configuration.
- The `main.tf` file contains the Terraform code that defines the resources in Azure.
- The `azurerm_storage_account` data source retrieves information about an existing storage account in Azure using the provided variables.
- The `data-factory` code is designed to work with Azure Blob Storage, but you can modify it to work with other Azure services as needed.