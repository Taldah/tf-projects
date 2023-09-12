
#resource "azurerm_resource_group" "Myrg-Prod" {
#  name     = var.resource_group_name
#  location = var.location
#data "azurerm_resource_group" "Myrg-Prod" {
#  name = "Myrg-Prod"
#location = var.location

#lifecycle {
#    prevent_destroy = true
#  }
  #tags = {
  #  Environment = "prod"

  #}


resource "azurerm_virtual_network" "main" {
  name = "vnet-vpn-${var.suffix}"
  location = var.location
  address_space = var.vnet_address_space
  resource_group_name = var.resource_group_name
  #depends_on = [
  #  azurerm_resource_group.GalimPro-Prod
  #]
}

resource "azurerm_subnet" "prodnet" {
  name = "prodnet"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = var.subnet_address_space
  resource_group_name = var.resource_group_name  
}

resource "azurerm_subnet" "gateway" {
  name = "GatewaySubnet"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = var.gateway_subnet
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "vpn" {
  name = "bi-vgw-vpn-${var.suffix}"  
  location = var.location
  allocation_method = var.public_ip_vpn
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network_gateway" "vpn" {

  name                = "vgw-vpn-${var.suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name

  type     = "Vpn"
  vpn_type = "RouteBased"


  active_active = false
  private_ip_address_enabled = false
  enable_bgp    = false
  sku           = "VpnGw2"

  ip_configuration {
    name                          = "vnetGatewaygalim"
    public_ip_address_id          = azurerm_public_ip.vpn.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway.id
  }
}