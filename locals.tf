locals {
  l_soc_vault_rg   = var.soc_vault_rg == null ? "soc-core-infra-${var.env}-rg" : var.soc_vault_rg
  l_soc_vault_name = var.soc_vault_name == null ? "soc-${var.env}" : var.soc_vault_name
}
