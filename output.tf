output "failover_group_id" {
  description = "The failover group ID."
  value       = azurerm_sql_failover_group.failover_group.id
}

output "primary_server_name" {
  description = "the name of the primary SQL Database Server"
  value       = azurerm_sql_failover_group.failover_group.server_name
}

output "failover_group_location" {
  description = "the location of the failover group."
  value       = azurerm_sql_failover_group.failover_group.location
}


