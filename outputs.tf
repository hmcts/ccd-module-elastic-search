output "resource_group_name" {
  value = "resource_group_name"
}

output "resource_group_location" {
  value = "resource_group_location"
}


output "nic_id" {
  value = module.virtual-machines.nic_id
}
output "vm_id" {
  value = module.virtual-machines.vm_id
}
