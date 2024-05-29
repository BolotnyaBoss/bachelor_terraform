# variables.tf
## Overview
The `variables.tf` file is used to define and document the variables that will be used in a specific infrastructure project. It provides a way to customize the project by allowing users to input values for these variables. These variables are used to configure various aspects of the project, such as resource group name, location, server name, administrator login, password, AAD login username, and object ID.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Variables](#variables)
4. [Useful details](#useful-details)

## Prerequisites
There are no specific dependencies or prerequisites required to use this file.

## Usage
To use the `variables.tf` file in a project, follow these steps:
1. Create a new file named `variables.tf` in the project directory.
2. Copy the code from the provided `variables.tf` file into the newly created `variables.tf` file.
3. Customize the values of the variables according to the project requirements.
4. Use the variables in other files of the project by referencing them using `var.<variable_name>` syntax.

## Variables
The `variables.tf` file defines the following variables:

1. `resource_group_name`:
   - Type: string
   - Description: The name of the resource group in which to create the server
   - Example usage: `var.resource_group_name`

2. `location`:
   - Type: string
   - Description: The location where the server should be created
   - Example usage: `var.location`

3. `server_name`:
   - Type: string
   - Description: The name of the server
   - Example usage: `var.server_name`

4. `server_administrator_login`:
   - Type: string
   - Description: The administrator login of the server
   - Example usage: `var.server_administrator_login`

5. `server_administrator_login_password`:
   - Type: string
   - Description: The administrator login password of the server
   - Example usage: `var.server_administrator_login_password`

6. `aad_login_username`:
   - Type: string
   - Description: The AAD administrator's login username
   - Example usage: `var.aad_login_username`

7. `object_id`:
   - Type: string
   - Description: The object ID of the client config
   - Example usage: `var.object_id`

## Useful details
- The variables defined in `variables.tf` can be referenced and used in other files of the project by using the `var.<variable_name>` syntax.
- It is recommended to provide appropriate default values for the variables in case they are not explicitly set during project configuration.
- The variables can be used to dynamically configure and customize various aspects of the project, such as resource group names, server names, and login credentials.