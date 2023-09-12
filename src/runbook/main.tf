resource "azurerm_automation_account" "check-secrestclient-expierd" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Basic"

  identity {
    type = "SystemAssigned"
  }
}

data "local_file" "secrestclient-expierd_runbk" {
  filename = "${path.module}/secret_expirationdate_filter.ps1"
}

resource "azurerm_automation_runbook" "secrestclient-expierd_runbk" {
  name                    = "secrestclient-expierd_runbk"
  location                = var.location
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This is an example runbook"
  runbook_type            = "PowerShellWorkflow"

  content = data.local_file.secrestclient-expierd_runbk.content
}