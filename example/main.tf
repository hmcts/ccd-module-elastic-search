resource "azurerm_resource_group" "rg" {
  name     = "ccd-elastic-search-${var.env}"
  location = "uk south"
  tags     = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}

module "ccd-test" {
  providers = {
    azurerm     = azurerm
    azurerm.cnp = azurerm.cnp
    azurerm.soc = azurerm.soc
    azurerm.dcr = azurerm.dcr
  }
  source            = "../."
  env               = "sbox"
  vm_name           = "test-vm-ccd-elastic-search"
  vm_resource_group = azurerm_resource_group.rg.name
  vm_admin_password = random_password.vm_password.result
  vm_subnet_id      = azurerm_subnet.subnet.id
  vm_private_ip     = "10.1.1.10"
  tags              = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
  managed_disks = {
    disk1 = {
      name                     = "ccd-data-0-datadisk"
      location                 = azurerm_resource_group.rg.location
      resource_group_name      = azurerm_resource_group.rg.name
      storage_account_type     = "Premium_LRS"
      disk_create_option       = "Empty"
      disk_size_gb             = "64"
      disk_tier                = "P6"
      disk_lun                 = "0"
      attachment_create_option = "Attach"
      source_resource_id       = null
      storage_account_id       = null
      hyper_v_generation       = null
      os_type                  = null
      disk_zone                = null
      disk_caching             = "None"
    }
    disk2 = {
      name                     = "ccd-data-1-datadisk"
      location                 = azurerm_resource_group.rg.location
      resource_group_name      = azurerm_resource_group.rg.name
      storage_account_type     = "Premium_LRS"
      disk_create_option       = "Empty"
      disk_size_gb             = "64"
      disk_tier                = "P6"
      disk_lun                 = "1"
      attachment_create_option = "Attach"
      source_resource_id       = null
      storage_account_id       = null
      hyper_v_generation       = null
      os_type                  = null
      disk_zone                = null
      disk_caching             = "None"
    }
  }
}


module "ctags" {
  source = "github.com/hmcts/terraform-module-common-tags.git?ref=master"

  builtFrom   = "github.com/hmcts/ccd-module-elastic-search"
  environment = "sbox"
  product     = "ccd"
}
resource "random_password" "vm_password" {
  length           = 16
  special          = true
  override_special = "#$%&@()_[]{}<>:?"
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1

}

# Create a new virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
  location            = "uksouth" # use the same region as your resource group
  resource_group_name = azurerm_resource_group.rg.name
}

# Create a subnet in the new VNet
resource "azurerm_subnet" "subnet" {
  name                 = "vm-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}
