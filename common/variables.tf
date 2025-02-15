variable "base-name" {}

variable "location" {}

variable "app_service_principal_id" {
    description = "List of App Service principal ID that will need to have Contributor, App Config Data Owner, Storage Account Data Owner role and proper KV access."
    type = list(string)
    }

variable "ad_group_write" {
    description = "List of AD groups principal IDs that will have wider access - Contributor, App Config Data Owner, Storage Account Data Owner and prober KV access"
    type = list(string)
}

variable "ad_group_read" {
    description = "List of AD groups principal IDs that will have read access and Get/List KV access "
    type = list(string)
}

