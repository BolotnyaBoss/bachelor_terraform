# Project Structure

- `modules/resource-group`: Contains Terraform configuration for creating a resource group.
- `modules/storage-account`: Contains Terraform configuration for creating a storage account and container.
- `modules/sql-database`: Contains Terraform configuration for creating an SQL database and importing data.
- `modules/data-factory`: Contains Terraform configuration for creating a data factory and associated pipelines.

# Installation and Setup

Follow these steps to install dependencies and configure the project:
1. Install Terraform and configure it with your cloud provider credentials.
2. Initialize Terraform to download required providers and modules with `terraform init`.

# Running the Project

To run the project locally, use the following command:
`terraform apply`

To deploy the project to a server:
1. Set up your CI/CD pipeline to use Terraform.
2. Add necessary secrets like cloud provider credentials to your CI/CD environment.
3. Configure the pipeline to run `terraform apply` on the desired environment.

# Usage and Features

This Terraform project automates the deployment of a cloud infrastructure that includes:
- A resource group.
- A storage account with a container for storing BACPAC files.
- An SQL server and database for data management.
- A data factory for orchestrating and automating data movement and data transformation.

# Testing

Run the project's tests with `terraform plan`. This will show you any changes that Terraform plans to make to your infrastructure without applying them.

# Troubleshooting and FAQs

If you encounter any issues, please check the Terraform documentation or reach out to the community forums for support.

# Contributing

Contributions to this project are welcome! Please fork the repository, make your changes, and submit a pull request.

# License and Acknowledgments

This project is licensed under the MIT License - see the LICENSE.md file for details. We acknowledge all external resources and dependencies used in this project.
