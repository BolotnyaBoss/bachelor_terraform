# variables.tf
## Overview
The `variables.tf` file is used to define and declare variables that are used in a software project. These variables can be used to store and retrieve data values that may change or need to be customized for different environments or configurations. This file plays a crucial role in providing flexibility and customization to the project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
There are no specific dependencies or prerequisites required to use the `variables.tf` file.

## Usage
To use the `variables.tf` file in a project, follow these steps:
1. Create a new file named `variables.tf` in the project directory.
2. Copy the code from the provided example or define your own variables using the same syntax.
3. Modify the values and descriptions of the variables according to your project requirements.
4. Use these variables in other files or modules within the project by referencing their names.

## Methods
The `variables.tf` file does not contain any methods or functions. It only defines variables using the following syntax:

```
variable "variable_name" {
    type        = data_type
    description = "Variable description"
}
```

Here is a list of variables defined in the `variables.tf` file:

1. `server_id`: Stores the ID of the server in which to create the database.
Example:
```
variable "server_id" {
    type        = string
    description = "The id of the server in which to create the database"
}
```

2. `database_name`: Stores the name of the database that needs to be created.
Example:
```
variable "database_name" {
    type        = string
    description = "The name of the database which need to create"
}
```

3. `storage_account_name`: Stores the name of the storage account where the bacpac file is stored.
Example:
```
variable "storage_account_name" {
    type        = string
    description = "The name of the storage account where stored bacpac file"
}
```

4. `storage_container_name`: Stores the name of the storage container where the bacpac file is stored.
Example:
```
variable "storage_container_name" {
    type        = string
    description = "The name of the storage container where stored bacpac file"
}
```

5. `blob_filename`: Stores the name of the bacpac file.
Example:
```
variable "blob_filename" {
    type        = string
    description = "The name of the bacpac file"
}
```

6. `storage_account_primary_key`: Stores the primary access key of the storage account.
Example:
```
variable "storage_account_primary_key" {
    type        = string
    description = "The storage account primary access key"
}
```

7. `server_administrator_login`: Stores the administrator login of the server.
Example:
```
variable "server_administrator_login" {
    type        = string
    description = "The administrator login of server"
}
```

8. `server_administrator_login_password`: Stores the administrator login password of the server.
Example:
```
variable "server_administrator_login_password" {
    type        = string
    description = "The administrator login password of server"
}
```

## Useful details
- The variables defined in the `variables.tf` file can be accessed and used in other files or modules within the project by referencing their names.
- The `type` attribute specifies the data type of the variable.
- The `description` attribute provides a brief description of the variable and its purpose.
- These variables can be customized for different environments or configurations by modifying their values.