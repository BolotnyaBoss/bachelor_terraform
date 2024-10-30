## Usage
To use the `data-factory` module in your project, follow these steps:

1. Make sure you have Terraform installed on your machine.

2. Clone the project repository to your local machine.

3. Navigate to the `data-factory` folder within the `modules` directory.

4. Open the `main.tf` file and modify the configuration according to your needs. This file contains the definition of the infrastructure resources that will be provisioned in Azure.

5. Open the `variables.tf` file and update the variables defined within it. These variables provide configurable options for the `data-factory` module.

6. Run the Terraform commands to initialize the working directory and apply the changes:

   ```
   terraform init
   terraform apply
   ```

   This will initialize the Terraform working directory and apply the changes, creating the specified Azure resources.

## Useful details
- The `main.tf` file is written in HashiCorp Configuration Language (HCL), which is the language used by Terraform to define infrastructure resources.

- The `variables.tf` file contains variable declarations that can be used to customize the behavior of the `data-factory` module. These variables can be set to different values based on the requirements of your project.

- The `data-factory` module is designed to work with Azure resources and specifically focuses on provisioning and managing data factories.

- It is important to note that the `data-factory` module is just one component of a larger project. It is meant to be used in conjunction with other modules and resources to create a complete infrastructure setup in Azure.