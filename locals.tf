locals {
  l_soc_vault_rg   = var.soc_vault_rg == null ? "soc-core-infra-${var.env}-rg" : var.soc_vault_rg
  l_soc_vault_name = var.soc_vault_name == null ? "soc-${var.env}" : var.soc_vault_name

  rbac_config = {
    "standard" = {
      scope                = module.virtual-machines.vm_id
      role_definition_name = "Virtual Machine User Login"
      principal_id         = var.env == "prod" || var.env == "production" ? "13dcb358-2b32-4afe-8d61-7889dc7dd39e" : "6a235ef2-26b8-4e52-a9fa-154091ca19d0" #DTS Production CCD Access for Users   / DTS Non-Production CCD Access for Users 

    },
    "sudo" = {
      scope                = module.virtual-machines.vm_id
      role_definition_name = "Virtual Machine Administrator Login"
      principal_id         = var.env == "prod" || var.env == "production" ? "219a0bcd-32e6-41df-bd3e-ec830500be98" : "975eb5f1-1fbf-4359-b7c3-8f4db3569351" # DTS Production CCD Access for Administrators /  DTS Non-Production CCD Access for Administrators

    }
  }
}
