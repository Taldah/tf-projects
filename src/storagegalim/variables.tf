variable "resource_group_name" {
  default = "Prod"
}

variable "location" {
  default = "westeurope"

}

variable "storage_account_name" {
  description = "The name of the azure storage account"
  default     = "tfsorage"
  type        = string
}

variable "account_kind" {
  description = "The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  default     = "StorageV2"
  type        = string
}

variable "skuname" {
  description = "The SKUs supported by Microsoft Azure Storage. Valid options are Premium_LRS, Premium_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, Standard_ZRS"
  default     = "Standard_LRS"
  type        = string
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = "Hot"
  type        = string
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account"
  default     = "TLS1_2"
  type        = string
}

variable "replication_type" {
  description = "Storage account replication type - i.e. LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  default     = "LRS"
  type        = string
}

variable "access_type" {
  description = "Defines the Type for this storage account (public or private)"
  default     = "private"
  type        = string
}
