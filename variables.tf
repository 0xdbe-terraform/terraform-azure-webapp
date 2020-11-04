variable "azure_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource in Azure (default: 'eastus', less expensive location)"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Ressource Group in which this ressource will be"
}

variable "application_short_name" {
  type        = string
  description = "Short name of your application using abbreviations or acronyms."
  validation {
    condition     = can(regex("^\\w+$", var.application_short_name))
    error_message = "Application short name can only consist of letters and numbers."
  }
}

variable "application_environment" {
  type        = string
  default     = "prod"
  description = "Name of the environment (example: dev, test, prod, ...)"
}