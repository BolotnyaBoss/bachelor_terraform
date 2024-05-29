# variables.tf
## Overview
The `variables.tf` file is used to define and declare variables that will be used in a software project. These variables are used to store and manage configuration values that can be easily modified without having to modify the code itself. This file plays a crucial role in providing flexibility and customization to the project by allowing users to easily modify the values of these variables without having to go into the codebase.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
There are no specific dependencies or prerequisites required to use this file.

## Usage
To use the `variables.tf` file in a project, follow these steps:
1. Create a new file in your project directory called `variables.tf`.
2. Copy the code from the provided example into the `variables.tf` file.
3. Modify the values of the variables based on your project's requirements.
4. Save the file and use the variables throughout your project as needed.

## Methods
The `variables.tf` file does not contain any methods or functions. It only contains variable declarations that can be used throughout the project. Here are the variables defined in the file:

1. `resource_group_name`: This variable stores the name of the resource group in which to create a storage account.
2. `location`: This variable stores the location where the storage account will be created.
3. `storage_account_name`: This variable stores the name of the storage account.
4. `storage_container_name`: This variable stores the name of the storage container.
5. `bacpac_file_name`: This variable stores the file name of the bacpac for the database.
6. `bacpac_path`: This variable stores the path where the bacpac file for the database is located.
7. `server_name`: This variable stores the name of the server.
8. `database_name`: This variable stores the name of the database that needs to be created.
9. `server_administrator_login`: This variable stores the administrator login of the server.
10. `server_administrator_login_password`: This variable stores the administrator login password of the server.
11. `aad_login_username`: This variable stores the name login username of the AAD administrator.
12. `data_factory_name`: This variable stores the name of the data factory instance.
13. `linked_service_name`: This variable stores the name of the linked service in the ADF instance.

## Useful details
None.