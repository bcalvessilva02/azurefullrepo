module "azuredevops" {
  source = "./modules/azuredevops_full_repo"

  prefix      = var.prefix
  description = var.description
  # ...
}

#module "azurerm_appservicelinuxzippython" {
#  source = "./azurerm/app_service_linux_zip_python"

#  prefix   = "bruno3"
#  location = "eastus"
#}

module "azurerm_appservicelinuxgitpython" {
  source = "./modules/azurerm_app_service_linux_git_python"

  prefix   = var.prefix
  location = var.location

  repo_url    = module.azuredevops.repo_url
  repo_branch = module.azuredevops.repo_branch
}
