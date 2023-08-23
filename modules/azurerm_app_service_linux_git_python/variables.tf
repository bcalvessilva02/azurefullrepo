variable "prefix" {
  type        = string
  description = "The prefix used for all resources in this example"
}

variable "location" {
  type        = string
  description = "The Azure location where all resources in this example should be created"
}

variable "repo_url" {
  type        = string
  description = "The Azure Dev Ops repo url"
}

variable "repo_branch" {
  type        = string
  description = "The Azure Dev Ops repo branch"
}
