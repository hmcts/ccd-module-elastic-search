module "virtual-machines" {
  providers = {
    azurerm     = azurerm
    azurerm.cnp = azurerm.cnp
    azurerm.soc = azurerm.soc
    azurerm.dcr = azurerm.dcr
  }

  source                       = "github.com/hmcts/terraform-module-virtual-machine.git?ref=master"
  vm_type                      = "linux"
  vm_name                      = var.vm_name
  env                          = var.env
  vm_resource_group            = var.vm_resource_group
  vm_location                  = var.location
  vm_admin_name                = var.vm_admin_name
  vm_admin_password            = var.vm_admin_password != null ? var.vm_admin_password : null
  vm_availabilty_zones         = var.vm_availabilty_zones
  vm_subnet_id                 = var.vm_subnet_id
  vm_publisher_name            = var.vm_publisher_name
  vm_offer                     = var.vm_offer
  vm_sku                       = var.vm_sku
  vm_size                      = var.vm_size
  vm_version                   = var.vm_version
  vm_private_ip                = var.vm_private_ip
  enable_availability_set      = var.enable_availability_set
  availability_set_name        = var.availability_set_name
  platform_update_domain_count = var.platform_update_domain_count

  os_disk_name                 = var.os_disk_name
  os_disk_storage_account_type = var.os_disk_storage_account_type
  os_disk_size_gb              = var.os_disk_size_gb
  managed_disks                = var.managed_disks

  install_azure_monitor        = var.install_azure_monitor
  install_dynatrace_oneagent   = var.install_dynatrace_oneagent
  install_splunk_uf            = var.install_splunk_uf
  nessus_install               = var.nessus_install
  custom_script_extension_name = var.custom_script_extension_name
  tags                         = var.tags

  soc_vault_rg   = local.l_soc_vault_rg
  soc_vault_name = local.l_soc_vault_name

  vm_admin_ssh_key       = var.vm_admin_ssh_key
  deploy_entra_extension = true
  rbac_config            = local.rbac_config

  disable_password_authentication = true
}
