 Azure terraform-azure-sql-failover
 =====================================
 
 [![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png
  
  
* Failover is a backup operational mode that automatically switches to a standby database,
  server or network if the primary system fails, or is shut down for servicing. 
* The auto-failover groups feature allows you to manage the replication and failover of some or all databases on a logical server to another region.
* This moudle focuses on using the Auto-failover group feature with Azure SQL Database .

**Note : For more information, you can check example folder.**

Terraform versions
------------------
Terraform v0.15.4

Resources
------
| Name | Type |
|------|------|
| [azurerm_sql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server) | resource |
| [azurerm_sql_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_firewall_rule) | resource |
| [azurerm_sql_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_database) | resource |
| [azurerm_sql_failover_group.failover_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_failover_group) | resource |


Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Name of Resource Group | `string` |  | yes |
| primary_server_name | Name of primary sql server. This we will get from another module | `string` |  | yes |
| failover_group_name | Name of our SQL DB failover group | `string` | | yes |
| sql_failover_db_id | ID(s) of Failover SQL DB. This we will get from another module | `list(string)` | | yes |
| secondary_server_id | ID of Secondary sql server. This we will get from another module | `string` | | yes |
| failover_policy_mode | Mode of R/W endpoint failover policy | `string` | Automatic | yes |
| failover_policy_grace_minutes | Grace minutes of R/W endpoint failover policy | `string` | 60 | yes |


Output
------
| Name | Description |
|------|-------------|  
| failover_group_id | The failover group ID. |
| primary_server_name | The name of the primary SQL Database Server |
| failover_group_location | the location of the failover group. |

Tags
----
* Tags are assigned to resources according requirement.
* Additial tags can be assigned by tags variables as defined above.

## Related Projects

Check out these related projects.

* [Resource Group](https://registry.terraform.io/modules/OT-terraform-azure-modules/resource-group/azure/latest)
* [SQL firewall](https://github.com/OT-terraform-azure-modules/terraform-azure-sql-db)


Usage
-----
```hcl
module "sql_failover" {
  source                        = "Location of your files"
  failover_group_name           = ""
  resource_group_name           = module.res_group.resource_group_name
  primary_server_name           = module.mysql_firewall.sql_server_name[0]
  sql_failover_db_id            = module.mysql_firewall.sql_database_id
  secondary_server_id           = module.mysql_firewall.sql_server_id[1]
  failover_policy_mode          = ""
  failover_policy_grace_minutes = ""
}

```

### Contributors
|  [![Reena Nain][Reena_avatar]][Reena_homepage]<br/>[Reena Nain][Reena_homepage] |
|---|


  [reena_homepage]: https://github.com/reena.nai 
  [reena_avatar]: https://gitlab.com/uploads/-/system/user/avatar/9292330/avatar.png?width=400








