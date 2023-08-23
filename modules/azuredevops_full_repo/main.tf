terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "~>0.6.0" #atualiza apenas 0.6.x
    }
  }
}

resource "azuredevops_project" "project" {
  name = "My Awesome Project"
  description  = "All of my awesomee things"
}

resource "azuredevops_git_repository" "repository" {
  project_id = azuredevops_project.project.id
  name       = "My Awesome Repo"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_build_definition" "build_definition" {
  project_id = azuredevops_project.project.id
  name       = "My Awesome Build Pipeline"
  path       = "\\"

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.repository.id
    branch_name = azuredevops_git_repository.repository.default_branch
    yml_path    = "azure-pipelines.yml"
  }
}