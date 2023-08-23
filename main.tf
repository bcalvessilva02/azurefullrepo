module "azuredevops" {
  source = "./azuredevops/full_repo"

  # ...
}

#module "azurerm_appservicelinuxzippython" {
#  source = "./azurerm/app_service_linux_zip_python"

#  prefix   = "bruno2"
#  location = "eastus"
#}

module "azurerm_appservicelinuxgitpython" {
  source = "./azurerm/app_service_linux_git_python"

  prefix   = "bruno3"
  location = "eastus"

  repo_url = module.azuredevops.repo_url
  repo_branch = module.azuredevops.repo_branch
}
