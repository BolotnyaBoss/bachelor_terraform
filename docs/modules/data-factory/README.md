# docs/modules/data-factory/README.md

## Overview
The `data-factory` folder contains the necessary files for provisioning and managing Azure resources using Terraform. The primary purpose of this folder is to define the infrastructure resources to be provisioned in Azure, including an Azure Storage Account, an Azure Data Factory, and a Linked Service for Azure Blob Storage. This folder plays a crucial role in automating the provisioning and management of Azure resources as part of a larger software project.

## Usage
To utilize the `data-factory` folder in a project, follow these steps:
1. Ensure that the necessary prerequisites are met (detailed in the `prerequisites` section).
2. Instantiate the `main.tf` file, which contains the Terraform configuration for provisioning the Azure resources.
3. Customize the `variables.tf` file to define and declare variables specific to your project.
4. Run Terraform commands to apply the configuration and provision the Azure resources.

## Useful details
Here are some additional details that may be helpful when working with the `data-factory` folder:
- The `main.tf` file defines the infrastructure resources to be provisioned in Azure. It includes the creation of an Azure Storage Account, an Azure Data Factory, and a Linked Service for Azure Blob Storage.
- The `variables.tf` file is used to define and declare variables that will be used in the project. It allows for customizing and configuring different aspects of the project by providing values for these variables.
- The `variables.tf` file facilitates flexibility and modularity in the project, as it allows for easy modification of key parameters without modifying the actual code.
- Before using the `data-factory` folder, make sure to fulfill the prerequisites outlined in the `prerequisites` section of each file.
- Refer to the table of contents in each file for easy navigation and access to specific sections of interest.