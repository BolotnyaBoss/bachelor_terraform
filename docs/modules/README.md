the Blob Storage account.

The `variables.tf` file is used to declare and define the input variables that are required by the `main.tf` file. These variables can be customized by the user to specify the desired configuration for the Data Factory and Blob Storage.

## Usage
To utilize the `data-factory` module in your project, follow these steps:

1. Ensure that you have Terraform installed on your machine.
2. Copy the contents of the `data-factory` folder into your Terraform project directory.
3. Open the `main.tf` file and configure the desired settings for your Data Factory and Blob Storage. You may need to modify values such as the resource group, location, and connection details.
4. Open the `variables.tf` file and customize the input variables as needed.
5. Run the `terraform init` command in your project directory to initialize the Terraform environment.
6. Run the `terraform apply` command to create the Azure resources defined in the `main.tf` file.

## Useful details
- The `data-factory` module is designed to work with Azure services and specifically focuses on creating a Data Factory and linking it to Blob Storage. It may not be suitable for other cloud providers or different types of data integration scenarios.
- Before running the Terraform commands, ensure that you have valid Azure credentials and the necessary permissions to create and manage resources.
- Make sure to review the `main.tf` file and understand the resources and settings being provisioned. Modify them as needed to align with your project requirements.
- The `variables.tf` file contains a list of input variables that can be customized. Refer to the comments within the file for guidance on each variable's purpose and acceptable values.
- Additional documentation and examples can be found in the `README.md` file located in the `docs/modules/data-factory` directory.