variable "location" {
  description = "Target Azure location to deploy the resource"
  type        = string
  default     = "UK South"
}

variable "vm_admin_name" {
  default     = "ccdadmin"
  description = "The name of the administrator account for the VM"
}

variable "vm_availabilty_zones" {
  description = "Availability zones for the VM"
  type        = string
  default     = null
}

variable "vm_publisher_name" {
  description = "The publisher name of the VM image"
  type        = string
  default     = "Canonical"

}
variable "vm_offer" {
  description = "The offer name of the VM image"
  type        = string
  default     = "ubuntu-24_04-lts"

}
variable "vm_sku" {
  description = "The SKU name of the VM image"
  type        = string
  default     = "server"
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
  default     = "Standard_D4ds_v5"
}
variable "vm_version" {
  description = "The version of the VM image"
  type        = string
  default     = "latest"

}

variable "install_azure_monitor" {
  description = "Install Azure Monitor agent"
  type        = bool
  default     = true

}

variable "install_dynatrace_oneagent" {
  description = "Install Dynatrace OneAgent"
  type        = bool
  default     = true

}

variable "install_splunk_uf" {
  description = "Install Splunk Universal Forwarder"
  type        = bool
  default     = false

}

variable "nessus_install" {
  description = "Install Nessus agent"
  type        = bool
  default     = true

}

variable "os_disk_storage_account_type" {
  description = "The type of storage account for the OS disk"
  type        = string
  default     = "Premium_LRS"

}
variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB"
  type        = string
  default     = "30"

}

variable "custom_script_extension_name" {
  description = "The name of the custom script extension"
  type        = string
  default     = "HMCTSBootstrapScript"
}

variable "soc_vault_rg" {
  description = "The name of the resource group where the SOC Key Vault is located."
  type        = string
  default     = null
}

variable "soc_vault_name" {
  description = "The name of the SOC Key Vault."
  type        = string
  default     = null
}

variable "vm_admin_ssh_key" {
  type        = string
  description = "The SSH public key to use for the admin user. This or vm_admin_password must be set."
  default     = null
  sensitive   = true
}

variable "enable_availability_set" {
  description = "Enable availability set for the VM"
  type        = bool
  default     = false
}

variable "availability_set_name" {
  description = "The name of the availability set to use if enable_availability_set is true"
  type        = string
  default     = null
}

variable "platform_update_domain_count" {
  description = "The number of platform update domains for the availability set"
  type        = number
  default     = 5
}

variable "ipconfig_name" {
  type        = string
  description = "The name of the IPConfig to asssoicate with the NIC."
  default     = null
}

variable "privateip_allocation" {
  type        = string
  description = "The type of private IP allocation, either Static or Dynamic."
  default     = "Dynamic"
}