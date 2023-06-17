locals {
  adf_github_configs = var.github_configuration == null ? {} : {github_conf = var.github_configuration}
}

resource "azurerm_data_factory" "default" {
  name                = "${var.global_prefix}-${var.location}-${var.environment_code}-${var.purpose}"
  location            = var.location
  resource_group_name = var.rg_name


  dynamic "github_configuration" {
    for_each = local.adf_github_configs
    content {
      account_name    = github_configuration.value.account_name
      branch_name     = github_configuration.value.branch_name
      repository_name = github_configuration.value.repository_name
      root_folder     = coalesce(github_configuration.value.root_folder, "/")
      git_url         = "https://github.com"
    }
  }
}
