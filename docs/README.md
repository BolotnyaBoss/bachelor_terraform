# docs/README.md

## Overview
The `docs` folder in this project contains the necessary documentation for the various components and modules used in the software project. This documentation serves as a guide for developers and users to understand the purpose and functionality of each component.

## Usage
To utilize the documentation in this folder, simply navigate to the desired subfolder or file and read the contents. Each subfolder or file provides information specific to a particular component or module within the project.

## Useful details
- The `docs` folder contains subfolders, such as `modules`, which further categorize the documentation based on the different components or modules in the project.
- The `modules` subfolder contains documentation for various modules, including the `data-factory` module.
- The `data-factory` module is responsible for creating a Data Factory and Blob Storage account.
- The `main.tf` file within the `data-factory` module defines the infrastructure code for creating the Data Factory and Blob Storage account.
- The `variables.tf` file within the `data-factory` module declares and defines the input variables required by the `main.tf` file.
- The user can customize these variables to specify the desired configuration for the Data Factory and Blob Storage account.

To utilize the `data-factory` module in your project, follow these steps:
1. Ensure that Terraform is installed on your machine.
2. Copy the contents of the `data-factory` folder into your Terraform project directory.
3. Customize the variables in the `variables.tf` file according to your requirements.
4. Run the Terraform commands to initialize the project and apply the infrastructure changes.

By following these steps, you can successfully utilize the `data-factory` module in your software project.