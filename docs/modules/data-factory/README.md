# docs/modules/data-factory/README.md

## Overview
The `data-factory` folder contains the `main.tf` and `variables.tf` files. These files are used in an Azure infrastructure project to define and provision resources such as storage accounts and data factories. The `main.tf` file is written in HashiCorp Configuration Language (HCL) and is used with Terraform, an infrastructure as code tool. It defines the configuration for creating a storage account, data factory, and a linked service for Azure Blob Storage. The `variables.tf` file is used to define variables that can be utilized throughout the software project. It serves as a centralized location to store and manage variable definitions, making it easier to update and maintain the project.

## Usage
To use the `data-factory` module in your project, follow these steps:
1. Make sure you have the necessary prerequisites and dependencies in place.
2. Copy the `main.tf` and `variables.tf` files from the `data-factory` folder into your project directory.
3. Update the variables in the `variables.tf` file to match your specific project requirements.
4. Run the Terraform commands to apply the configuration defined in the `main.tf` file and provision the necessary resources.

## Useful details
- The `main.tf` file is written in HashiCorp Configuration Language (HCL) and is used with Terraform to define and provision Azure resources.
- The `variables.tf` file is used to define variables that can be used throughout the software project, providing a centralized location for managing variable definitions.
- It is important to ensure that all dependencies and prerequisites are met before using the `data-factory` module.
- The `main.tf` file defines the configuration for creating a storage account, data factory, and a linked service for Azure Blob Storage.