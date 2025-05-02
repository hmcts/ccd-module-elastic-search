locals {
  backend_vm_addresses = {
    for vm_key, vm_val in var.vms : vm_key => vm_val.ip
  }
}

resource "azurerm_lb" "this" {
  name                = "ccd-internal-${var.env}-lb"
  location            = var.location
  resource_group_name = "ccd-elastic-search-${var.env}"
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "LBFE"
    subnet_id                     = var.subnet_name
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip_address
  }
}

resource "azurerm_lb_backend_address_pool" "this" {
  name                = "LBBE"
  loadbalancer_id     = azurerm_lb.this.id
}

resource "azurerm_lb_backend_address_pool_address" "vm_addresses" {
  for_each                = var.backend_vm_addresses
  name                    = each.key
  backend_address_pool_id = azurerm_lb_backend_address_pool.this.id
  ip_address              = each.value
}

resource "azurerm_lb_probe" "es_probe_transport_internal" {
  name                = "es-probe-transport-internal"
  protocol            = "Tcp"
  port                = 9300
  loadbalancer_id     = azurerm_lb.this.id
}

resource "azurerm_lb_probe" "es_probe_internal_http" {
  name                = "es-probe-internal-http"
  protocol            = "Tcp"
  port                = 9200
  loadbalancer_id     = azurerm_lb.this.id
}

resource "azurerm_lb_rule" "es_transport_internal" {
  name                           = "es-transport-internal"
  protocol                       = "Tcp"
  frontend_port                  = 9300
  backend_port                   = 9300
  frontend_ip_configuration_name = azurerm_lb.frontend_ip_configuration.this.name
  backend_address_pool_ids       = azurerm_lb_backend_address_pool.this.id
  probe_id                       = azurerm_lb_probe.es_probe_transport_internal.id
  loadbalancer_id                = azurerm_lb.this.id
}

resource "azurerm_lb_rule" "es_http_internal" {
  name                           = "es-http-internal"
  protocol                       = "Tcp"
  frontend_port                  = 9200
  backend_port                   = 9200
  frontend_ip_configuration_name = azurerm_lb.frontend_ip_configuration.this.name
  backend_address_pool_ids       = azurerm_lb_backend_address_pool.this.id
  probe_id                       = azurerm_lb_probe.es_probe_internal_http.id
  loadbalancer_id                = azurerm_lb.this.id
}