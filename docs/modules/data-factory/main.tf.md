# main.tf
## Overview
This Terraform configuration file provisions and connects Azure resources related to data integration workflows. It fetches an existing Azure Storage Account, creates an Azure Data Factory instance, and establishes a linked service to the Azure Blob Storage within the Data Factory. This setup is typically used in projects that require data orchestration and pipeline automation on Azure.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform installed (version compatible with AzureRM provider used)  
- AzureRM Provider configured with appropriate credentials  
- Existing Azure Storage Account (name and Resource Group provided)  
- Variables defined for:  
  - `storage_account_name`  
  - `resource_group_name`  
  - `data_factory_name`  
  - `location`  
  - `linked_service_name`  

## Usage
1. Define the required variables in a `terraform.tfvars` or environment variables.  
2. Run Terraform commands to provision:  
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```  
3. This will create an Azure Data Factory instance and link it to the specified Azure Blob Storage account to enable data pipelines to operate over blob storage sources.

## Methods
- `data "azurerm_storage_account" "example"`  
  Retrieves metadata and connection strings for an existing Azure Storage Account.  
  - Parameters:  
    - `name`: Storage Account name (string)  
    - `resource_group_name`: Resource Group the storage account belongs to (string)  
  
- `resource "azurerm_data_factory" "adf"`  
  Creates a new Azure Data Factory instance.  
  - Parameters:  
    - `name`: Data Factory instance name (string)  
    - `location`: Azure region (string)  
    - `resource_group_name`: Resource Group name (string)  
  
- `resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls"`  
  Defines a linked service to Azure Blob Storage inside the Data Factory for data operations.  
  - Parameters:  
    - `name`: Linked service name (string)  
    - `data_factory_id`: ID of the Data Factory resource (string)  
    - `connection_string`: Connection string to Azure Storage Account (string)

## Useful details
- The `connection_string` for Azure Blob Storage is sourced securely from the existing storage account's primary connection string, avoiding hard-coded credentials.  
- This file is part of a larger Azure infrastructure-as-code setup aimed at building data integration environments using Azure Data Factory and Azure Storage.  
- Further resources like pipelines, datasets, and triggers can be added to augment Data Factory workflows with this foundation.