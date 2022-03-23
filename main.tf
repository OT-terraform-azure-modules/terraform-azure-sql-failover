resource "azurerm_sql_failover_group" "failover_group" {
  name                = var.failover_group_name
  resource_group_name = var.resource_group_name
  server_name         = var.primary_server_name
  databases           = var.sql_failover_db_id
  partner_servers {
    id = var.secondary_server_id
  }

  read_write_endpoint_failover_policy {
    mode          = var.failover_policy_mode
    grace_minutes = var.failover_policy_grace_minutes
  }
}


