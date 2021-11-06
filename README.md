# Terraform Azure

[![GitHub](https://img.shields.io/github/license/wozorio/terraform-azure)](https://github.com/wozorio/terraform-azure/blob/master/LICENSE)
[![CI](https://github.com/wozorio/terraform-azure/actions/workflows/ci.yml/badge.svg)](https://github.com/wozorio/terraform-azure/actions/workflows/ci.yml)
[![Deploy](https://github.com/wozorio/terraform-azure/actions/workflows/deploy.yml/badge.svg)](https://github.com/wozorio/terraform-azure/actions/workflows/deploy.yml)

Terraform code for deploying a Ubuntu Linux VM in Azure with GitHub Actions.

## Shutdown and Start

To save costs, the virtual machine is shutdown and started every day automatically with respective workflows in GitHub Actions. The shutdown is triggered at 11:00 PM UTC and the startup at 4:00 AM UTC.
