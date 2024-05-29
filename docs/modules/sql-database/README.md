# docs/modules/sql-database/README.md

## Overview
The `sql-database` folder contains the necessary files and configuration to create an Azure SQL Database resource using Terraform. This folder plays a crucial role in managing and provisioning cloud resources in Azure as part of an infrastructure-as-code (IaC) approach. The `main.tf` file defines and creates the Azure SQL Database resource, while the `variables.tf` file allows for customization and flexibility in the project.

## Usage
To utilize the `sql-database` folder in your project, follow these steps:
1. Ensure you have the necessary prerequisites in place.
2. Copy the `main.tf` and `variables.tf` files into your project directory.
3. Customize the variables in the `variables.tf` file according to your project's requirements.
4. Run Terraform commands to initialize, plan, and apply the configuration, which will create the Azure SQL Database resource.

## Useful details
### main.tf
The `main.tf` file is a Terraform configuration file that defines and creates an Azure SQL Database resource. It specifically uses the `azurerm_mssql_database` resource to create the database. This file is instrumental in managing and provisioning cloud resources in Azure using an infrastructure-as-code approach.

### variables.tf
The `variables.tf` file is used to define and declare variables that can be customized and used in a software project. These variables allow for flexibility and customization, especially when deploying the project in different environments or configurations. The file plays a crucial role in providing adaptability to the project.