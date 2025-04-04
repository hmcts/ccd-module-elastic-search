variable "env" {
  description = "Environment value"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_resource_group" {
  description = "Resource group name"
  type        = string
}

variable "vm_admin_password" {
  description = "The password for the administrator account for the VM"
  type        = string
  sensitive   = true
}

variable "vm_subnet_id" {
  description = "The subnet id to which the VM will be deployed"
  type        = string
}

variable "vm_private_ip" {
  description = "The private IP address of the VM"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the VM"
  type        = map(string)
  default     = {}
}

variable "managed_disks" {
  type = map(
    object(
      {
        name                     = string,
        location                 = string,
        resource_group_name      = string,
        storage_account_type     = string,
        disk_create_option       = string,
        disk_size_gb             = string,
        disk_tier                = string,
        disk_zone                = string,
        source_resource_id       = string,
        storage_account_id       = string,
        hyper_v_generation       = string,
        os_type                  = string,
        disk_lun                 = string,
        disk_caching             = string,
        attachment_create_option = string
      }
    )
  )
  description = "A map of managed disks to create & attach to the virtual machine."

}
