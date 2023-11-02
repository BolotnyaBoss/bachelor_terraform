module "key-vault" {
  source = "./modules/key-vault"

  key_vault_name       = var.key_vault_name
  resource_group_name  = var.resource_group_name
  location             = var.location

  depends_on = [
    module.resource-group
  ]
}
