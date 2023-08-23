output "repo_url" {
  value = azuredevops_git_repository.repository.remote_url
}

output "repo_branch" {
  value = replace(azuredevops_git_repository.repository.default_branch, "refs/heads/", "")

}
