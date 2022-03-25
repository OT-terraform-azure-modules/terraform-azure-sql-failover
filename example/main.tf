# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.86.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "res_group" {
  source                  = "OT-terraform-azure-modules/resource-group/azure"
  resource_group_name     = "azure_rg"
  resource_group_location = "Eastus"
  lock_level_value        = ""
  tag_map = {
    Name = "AzureRG"
  }
}

module "mysql_firewall" {
  source                = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-sql-db.git"
  resource_group_name   = module.res_group.resource_group_name
  sql_database_required = "true"
  regions               = ["East US", "West US"]
}

module "sql_failover" {
  source                        = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-sql-failover.git?ref=main"
  failover_group_name           = "testfailovergroup"
  resource_group_name           = module.res_group.resource_group_name
  primary_server_name           = module.mysql_firewall.sql_server_name[0]
  sql_failover_db_id            = module.mysql_firewall.sql_database_id
  secondary_server_id           = module.mysql_firewall.sql_server_id[1]
  failover_policy_mode          = "Automatic"
  failover_policy_grace_minutes = "60"
}
