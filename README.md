# Terraform Azure

[![terraform Actions Status](https://github.com/wozorio/terraform-azure/workflows/terraform/badge.svg)](https://github.com/wozorio/terraform-azure/actions)
![GitHub](https://img.shields.io/github/license/wozorio/terraform-azure)

Terraform code for deploying a Ubuntu Linux VM in Azure with GitHub Actions.

## Shutdown and Startup

To save costs, the virtual machine is shutdown and started every day automatically with respective workflows in GitHub Actions. The shutdown is triggered at 11:00 PM UTC and the startup at 4:00 AM UTC.
