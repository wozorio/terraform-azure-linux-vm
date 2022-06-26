# Terraform Azure

[![GitHub](https://img.shields.io/github/license/wozorio/terraform-azure)](https://github.com/wozorio/terraform-azure/blob/master/LICENSE)
[![CI](https://github.com/wozorio/terraform-azure/actions/workflows/ci.yml/badge.svg)](https://github.com/wozorio/terraform-azure/actions/workflows/ci.yml)
[![Deploy](https://github.com/wozorio/terraform-azure/actions/workflows/deploy.yml/badge.svg)](https://github.com/wozorio/terraform-azure/actions/workflows/deploy.yml)

Terraform code for deploying a Linux VM with Ubuntu 20.04 LTS (Focal Fossa) in Azure with GitHub Actions.

## Shutdown and Start

To save costs, the virtual machine is shutdown and started every day automatically with respective workflows in GitHub Actions. The shutdown is triggered at 11:00 PM UTC and the startup at 4:00 AM UTC.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.11.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nic_ubuntu"></a> [nic\_ubuntu](#module\_nic\_ubuntu) | ./modules/network_interface/ | n/a |
| <a name="module_nsg_association_vm_ubuntu"></a> [nsg\_association\_vm\_ubuntu](#module\_nsg\_association\_vm\_ubuntu) | ./modules/network_interface_security_group_association/ | n/a |
| <a name="module_nsg_vm_ubuntu"></a> [nsg\_vm\_ubuntu](#module\_nsg\_vm\_ubuntu) | ./modules/network_security_group/ | n/a |
| <a name="module_pip_ubuntu"></a> [pip\_ubuntu](#module\_pip\_ubuntu) | ./modules/public_ip/ | n/a |
| <a name="module_rg_playground"></a> [rg\_playground](#module\_rg\_playground) | ./modules/resource_group/ | n/a |
| <a name="module_snet"></a> [snet](#module\_snet) | ./modules/subnet/ | n/a |
| <a name="module_vm_ubuntu"></a> [vm\_ubuntu](#module\_vm\_ubuntu) | ./modules/linux_virtual_machine/ | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ./modules/virtual_network/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the resources should exist | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->