output "key_vault_id" {
  description = "The ID of the key vault"
  value       = azurerm_key_vault.example.id
}

output "key_vault_uri" {
  description = "The URI of the key vault for use in services"
  value       = azurerm_key_vault.example.vault_uri
}

# Add other necessary outputs