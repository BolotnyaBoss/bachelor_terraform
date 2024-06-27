# docs/modules/data-factory/README.md

## Overview
The `data-factory` folder contains the necessary files for provisioning and managing the infrastructure resources for an Azure Data Factory project. It includes the `main.tf` and `variables.tf` files.

## Usage
To utilize the `data-factory` module in your project, you can follow these steps:
1. Ensure you have the necessary prerequisites in place (see [Prerequisites](#prerequisites)).
2. Copy the `main.tf` and `variables.tf` files to your project directory.
3. Customize the variables in the `variables.tf` file to match your project requirements.
4. Execute the Terraform commands to initialize and apply the configuration.

## Useful details
- The `main.tf` file defines the infrastructure resources for the Azure Data Factory project, including a storage account, a data factory, and a linked service for Azure Blob Storage. It plays a crucial role in provisioning and managing the necessary infrastructure resources for data integration and orchestration tasks in the project.
- The `variables.tf` file is used to define and declare variables that can be used throughout the project. These variables allow for customization and configuration of various aspects, such as resource group names, locations, data factory names, storage account names, and linked service names. By centralizing the variables in this file, it becomes easier to maintain and update them as needed.

For more detailed information and instructions, please refer to the individual file documentation within the `data-factory` folder.