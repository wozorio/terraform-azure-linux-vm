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
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | A name used for this IP Configuration | `string` | n/a | yes |
| <a name="input_ip_configuration_private_ip_address"></a> [ip\_configuration\_private\_ip\_address](#input\_ip\_configuration\_private\_ip\_address) | The Static IP Address which should be used | `string` | `null` | no |
| <a name="input_ip_configuration_private_ip_address_allocation"></a> [ip\_configuration\_private\_ip\_address\_allocation](#input\_ip\_configuration\_private\_ip\_address\_allocation) | The allocation method used for the Private IP Address. Possible values are Dynamic and Static | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_private_ip_address_version"></a> [ip\_configuration\_private\_ip\_address\_version](#input\_ip\_configuration\_private\_ip\_address\_version) | The IP Version to use. Possible values are IPv4 or IPv6 | `string` | `"IPv4"` | no |
| <a name="input_ip_configuration_public_ip_address_id"></a> [ip\_configuration\_public\_ip\_address\_id](#input\_ip\_configuration\_public\_ip\_address\_id) | Reference to a Public IP Address to associate with this NIC | `string` | `null` | no |
| <a name="input_ip_configuration_subnet_id"></a> [ip\_configuration\_subnet\_id](#input\_ip\_configuration\_subnet\_id) | The ID of the Subnet where this Network Interface should be located in | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location where the Network Interface should exist | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Network Interface | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which to create the Network Interface | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the resource | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
<!-- END_TF_DOCS -->