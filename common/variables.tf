variable "bhgh-app" {}

variable "location" {}

variable "app_service_principal_id" {
    description = "List of Azure resources principal ID that will need to have Contributor, App Config Data Owner, Storage Account Data Owner role and Get/List KV access."
    type = list(string)
}

variable "ad_group_read" {
    description = "List of AD Groups principal IDs that will have READ RG, App Config and Storage access + Get/List KV access "
    type = list(string)
}

variable "ad_group_write" {
    description = "List of AD Groups principal IDs that will have wider access - Contributor, App Config Data Owner, Storage Account Data Owner and Get/List/Set KV access"
    type = list(string)
}

