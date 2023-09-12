variable "resource_group_name" {
  default = "Myrg-Prod"
}

variable "location" {
  default = "westeurope"

}

variable "suffix" {
  default = "name"

}

variable "vnetwork_name" {
  description = "Name of your Azure Virtual Network"
  default     = "vnet-mypro"
}

variable "vnet_address_space" {
  description = "The address space to be used for the Azure virtual network."
  default     = ["10.4.0.0/16"]
}

variable "subnet_address_space" {
  description = "The address space to be used for the Azure virtual network."
  default     = ["10.4.5.0/24"]
}

variable "gateway_subnet" {
  description = "The Gateway subnet"
  default     = ["10.4.10.0/24"]

}

variable "dns_servers" {
  description = "List of dns servers to use for virtual network"
  default     = []
}

variable "create_network_watcher" {
  description = "Controls if Network Watcher resources should be created for the Azure subscription"
  default     = true
}

variable "public_ip_vpn" {
  description = "Public ip for vpn"
  default     = "Dynamic"

}