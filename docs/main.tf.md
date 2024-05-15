# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines the infrastructure resources to be provisioned in an Azure environment. This file is used to create various Azure resources such as a resource group, storage account, SQL server, SQL database, and a data factory. It uses modules defined in separate directories to organize and manage the creation of each resource.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
- Terraform installed
- Azure provider configured

## Usage
To use this file in a project, follow these steps:
1. Install Terraform on your machine.
2. Configure the Azure provider by providing your Azure credentials.
3. Create a `main.tf` file in your project directory.
4. Copy the contents of the provided `main.tf` file into your `main.tf` file.
5. Modify the variables in the file to match your desired configuration.
6. Run `terraform init` to initialize the Terraform configuration.
7. Run `terraform plan` to preview the changes that will be made.
8. Run `terraform apply` to create the Azure resources.

## Methods
This file does not contain any methods or functions. It primarily consists of the Terraform configuration language which defines the infrastructure resources to be provisioned. It uses modules to encapsulate the creation and configuration of each resource, enabling reusability and modularity.

## Useful details
- The file uses the `azurerm` provider to interact with Azure.
- It defines variables such as `resource_group_name`, `location`, `storage_account_name`, etc., which can be customized to fit the project's requirements.
- The file includes modules such as `resource-group`, `storage-account`, `sql-server`, `sql-database`, and `data-factory` to create corresponding Azure resources.
- Each module has its own configuration variables and dependencies on other modules or data sources.
- The `depends_on` attribute in the `data-factory` module ensures that the data factory is only created after the storage account is available.
- The file retrieves information about the Azure account using the `azurerm_client_config` data source.