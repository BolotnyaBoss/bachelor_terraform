# Project Name

## Overview

This project uses Terraform for provisioning resources on Azure. It includes configurations for resource groups, SQL Server, storage accounts, data factory, and more.

## Requirements

Terraform v0.x.x

Azure Subscription

## Variables

The following variables need to be configured for the project:

- `resource_group_name`: The name of the resource group in which to create the server/storage account
- `location`: The location where to create the server/storage account
- `server_name`: The name of the server
- `server_administrator_login`: The administrator login of server
- `server_administrator_login_password`: The administrator login password of server
- `aad_login_username`: The name login username of AAD administrator
- `data_factory_name`: The name of data factory instance
- `linked_service_name`: The name of linked service in ADF instance
- `storage_account_name`: The name of storage account
- `storage_container_name`: The name of storage container
- `bacpac_file_name`: The file name of bacpac for database
- `bacpac_path`: The path where located bacpac file for database

## Outputs

The outputs generated after the successful execution of the code are:

- `name`: Resource Group name
- `location`: Resource Group Azure region
- `primary_key`: Primary key of storage account
- `id`: ID of SQL Server

## Usage

To initialize the project, use `terraform init`.

To check the execution plan, use `terraform plan`.

To apply the changes, use `terraform apply`.
