<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username of the local administrator used for the Virtual Machine | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the Linux Virtual Machine should exist | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The Name which should be used for this Resource Group | `string` | n/a | yes |
| <a name="input_network_interface_ids"></a> [network\_interface\_ids](#input\_network\_interface\_ids) | A list of Network Interface ID's which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine | `list(string)` | n/a | yes |
| <a name="input_os_disk_caching"></a> [os\_disk\_caching](#input\_os\_disk\_caching) | The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite | `string` | `"ReadWrite"` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard\_LRS, StandardSSD\_LRS and Premium\_LRS | `string` | `"StandardSSD_LRS"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which the Linux Virtual Machine should be exist | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | The SKU which should be used for this Virtual Machine, such as Standard\_F2 | `string` | n/a | yes |
| <a name="input_source_image_reference_offer"></a> [source\_image\_reference\_offer](#input\_source\_image\_reference\_offer) | Specifies the offer of the image used to create the virtual machines | `string` | `"0001-com-ubuntu-server-jammy"` | no |
| <a name="input_source_image_reference_publisher"></a> [source\_image\_reference\_publisher](#input\_source\_image\_reference\_publisher) | Specifies the publisher of the image used to create the virtual machines | `string` | `"canonical"` | no |
| <a name="input_source_image_reference_sku"></a> [source\_image\_reference\_sku](#input\_source\_image\_reference\_sku) | Specifies the SKU of the image used to create the virtual machines | `string` | `"22_04-lts-gen2"` | no |
| <a name="input_source_image_reference_version"></a> [source\_image\_reference\_version](#input\_source\_image\_reference\_version) | Specifies the version of the image used to create the virtual machines | `string` | `"latest"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to this Virtual Machine | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the virtual machine |
<!-- END_TF_DOCS -->