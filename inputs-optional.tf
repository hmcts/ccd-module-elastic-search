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
