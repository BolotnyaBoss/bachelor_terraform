# docs/modules/sql-server/README.md

## Overview
The `sql-server` folder contains the necessary files for managing Azure SQL Server resources using Terraform. This folder is part of a larger project that aims to provision and manage infrastructure resources on Azure. The `main.tf` file is responsible for creating an Azure SQL Server instance, the `outputs.tf` file defines the outputs of the module, and the `variables.tf` file defines and documents the variables used in the project.

## Usage
To use the code in this folder, follow these steps:
1. Ensure you have the necessary prerequisites in place.
2. Customize the variables in the `variables.tf` file according to your project requirements.
3. Run the Terraform commands to initialize and apply the configuration.

## Useful details
- The `main.tf` file is responsible for creating an Azure SQL Server instance. It utilizes Terraform to define and manage the necessary resources.
- The `outputs.tf` file defines the outputs of the module. These outputs can be used by other Terraform modules or scripts to interact with the provisioned resources.
- The `variables.tf` file defines and documents the variables used in the project. These variables allow users to customize various aspects of the infrastructure, such as resource group name, location, server name, administrator login, password, AAD login username, and object ID.