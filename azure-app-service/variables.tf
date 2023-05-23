variable "resource_group_name" {
  type    = string
  default = ""
}

variable "resource_group_location" {
  type    = string
  default = ""
}

variable "app_service_plan_name" {
  type    = string
  default = ""
}

variable "app_service_plan_sku_tier" {
  type    = string
  default = ""
}

variable "app_service_plan_sku_size" {
  type    = string
  default = ""
}

variable "app_service_name" {
  type    = string
  default = ""
}

variable "app_service_dotnet_framework_version" {
  type    = string
  default = ""
}

variable "app_service_app_command_line" {
  type    = string
  default = ""
}
