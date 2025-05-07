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
        location                 = optional(string, "uksouth"),
        resource_group_name      = string,
        storage_account_type     = string,
        disk_create_option       = optional(string, "Empty"),
        disk_size_gb             = optional(string, "1024"),
        disk_tier                = optional(string, null),
        disk_zone                = optional(string, null),
        source_resource_id       = optional(string, null),
        storage_account_id       = optional(string, null),
        hyper_v_generation       = optional(string, null),
        os_type                  = optional(string, null),
        disk_lun                 = string,
        disk_caching             = optional(string, "None"),
        attachment_create_option = optional(string, "Attach")
      }
    )
  )
  description = "A map of managed disks to create & attach to the virtual machine."

}

variable "os_disk_name" {
  description = "Name of the OS disk"
  type        = string
}

variable "vms" {
  description = "Map of VM definitions including IPs"
  type = map(object({
    name = string
    ip   = string
    managed_disks = map(object({
      name                = string
      resource_group_name = string
      disk_lun            = string
    }))
  }))
}

variable "backend_vm_addresses" {
  type        = map(string)
  description = "Map of VM names to IP addresses"
}

variable "lb_private_ip_address" {
  description = "Private IP address for the load balancer"
  type        = string
  default     = null
}
