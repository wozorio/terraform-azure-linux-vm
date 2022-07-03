resource "azurerm_managed_disk" "this" {
  name                 = var.name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb

  encryption_settings {
    enabled = true
  }

  tags = var.tags
}
