provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags = {
    Team = "Dev"
  }
}

resource "azurerm_service_plan" "example" {
  name                = "${var.prefix}-sp"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "${var.prefix}-lwa"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    application_stack {
      python_version = "3.11"
    }
    always_on = false
  }

  app_settings = {
  }
}

resource "azurerm_app_service_source_control" "example" {
  app_id   = azurerm_linux_web_app.example.id
  repo_url = var.repo_url
  branch   = var.repo_branch
}
