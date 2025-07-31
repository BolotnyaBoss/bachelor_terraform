# outputs.tf
## Overview
This Terraform output configuration file defines an output variable that exposes the primary access key of an Azure Storage Account created elsewhere in the infrastructure code. It enables other modules or users to easily retrieve and use the storage account key once the Terraform apply process completes. This kind of output is useful for sharing sensitive or important values that are required for subsequent provisioning steps or external integrations.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform installed (version compatible with the Azure Provider)  
- Azure Provider configured in your Terraform project (`azurerm` provider)  
- A storage account resource named `azurerm_storage_account.sa` already declared in your Terraform configuration

## Usage
After defining this output, run `terraform apply` to deploy your infrastructure. Terraform will then display the value of the primary storage account key. You can also retrieve it programmatically:

```bash
terraform output primary_key
```

Within other Terraform modules or scripts, you can reference this output as:

```hcl
module.<module_name>.primary_key
```

to pass the key securely between modules.

## Methods
- **output "primary_key"**  
  - **value:** References `azurerm_storage_account.sa.primary_access_key`, the secret key for the storage account.  
  - **description:** Provides a human-readable explanation, "Primary key of storage account".

## Useful details
- The output exposes a sensitive key; consider marking it as `sensitive = true` in production to avoid accidental exposure.  
- This output depends on the existence of the `azurerm_storage_account.sa` resource; changing the resource name will require updating the output accordingly.  
- Typically, this output is used to configure access for other resources like Azure functions, VMs, or external applications that need storage connectivity.