# Project Description

This repository contains infrastructure code for provisioning and managing Azure resources using Terraform. It enables the creation and management of a resource group, Azure SQL server, and associated databases, as well as storage accounts and a data factory for data orchestration.

## Installation Instructions

To use this infrastructure code, ensure you have Terraform installed and configured with Azure credentials. Clone the repository, navigate to the root directory, and run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

## Usage Guidelines

After successfully applying the Terraform configurations, your Azure resources should be provisioned. You can manage these resources through the Azure portal or by modifying the Terraform configurations and reapplying them.

## Variables

The Terraform configurations use several variables to allow customization of the created resources. Ensure to provide values for the following variables:

- `resource_group_name`: Name of the Azure resource group.
- `location`: Azure region for the resource group.
- `server_name`: Name of the Azure SQL server.
- `server_administrator_login`: Administrator login for the SQL server.
- `server_administrator_login_password`: Password for the SQL server administrator.
- `aad_login_username`: Username for the Azure Active Directory (AAD) administrator.
- `object_id`: Object ID for the client configuration in AAD.

## Modules

The code is organized into modules for better modularity and reuse. The modules include:

- `resource-group`: Defines the Azure resource group.
- `sql-server`: Provisions an Azure SQL server and its settings.
- `sql-database`: Manages Azure SQL databases.
- `storage-account`: Sets up Azure storage accounts and containers.
- `data-factory`: Configures an Azure data factory for data movement and transformation tasks.

## Outputs

The Terraform configurations define outputs that can be used to retrieve information about the provisioned resources, such as the resource group name and location.

## Providers

The code uses the `azurerm` provider to interact with Azure resources. Ensure that it is properly configured with the necessary permissions.

Please refer to the module directories for detailed information on each module's inputs and outputs.