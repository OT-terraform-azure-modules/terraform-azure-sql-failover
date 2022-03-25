variable "failover_group_name" {
  type        = string
  description = "(Required) Name of our SQL DB failover group"
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Name of the resource group. This we will get from another module"
}

variable "primary_server_name" {
  type        = string
  description = "(Required) Name of primary sql server. This we will get from another module"
}

variable "sql_failover_db_id" {
  type        = list(string)
  description = "(Required) ID(s) of Failover SQL DB. This we will get from another module"
}

variable "secondary_server_id" {
  type        = string
  description = "(Required) ID of Secondary sql server. This we will get from another module"
}

variable "failover_policy_mode" {
  type        = string
  description = "(Required) Mode of R/W endpoint failover policy"
  default     = "Automatic"
}

variable "failover_policy_grace_minutes" {
  type        = string
  description = "(Required) Grace minutes of R/W endpoint failover policy"
  default = "60"
}
