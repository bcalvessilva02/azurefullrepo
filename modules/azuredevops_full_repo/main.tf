resource "azuredevops_project" "project" {
  name = "${var.prefix}-prj"
  description  = "${var.description}"
}

resource "azuredevops_git_repository" "repository" {
  project_id = azuredevops_project.project.id
  name       = "${var.prefix}-repo"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_build_definition" "build_definition" {
  project_id = azuredevops_project.project.id
  name       = "${var.prefix}-pipe"
  path       = "\\"

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.repository.id
    branch_name = azuredevops_git_repository.repository.default_branch
    yml_path    = "azure-pipelines.yml"
  }
}