variable "global_prefix" {
  type        = string
  description = "The global prefix for resources."
}

variable "purpose" {
  type        = string
  description = "The purpose of the resource."
}

variable "environment_code" {
  type        = string
  description = "The environment code."
}

variable "location" {
  type        = string
  description = "The Azure region."
}

variable "rg_name" {
  type        = string
  description = "The resource group name."
}

variable "github_configuration" {
  type = object({
    account_name    = string
    branch_name     = string
    repository_name = string
    root_folder     = optional(string)
  })
  default = null
}

variable "tags" {
  type        = map(string)
  description = "The resource tags."
}
