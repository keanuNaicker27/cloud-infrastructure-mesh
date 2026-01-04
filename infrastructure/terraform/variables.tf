variable "project_name" {
  description = "The name of the overall platform"
  type        = string
  default     = "sentinel-mesh"
}

variable "environment" {
  description = "dev, staging, or prod"
  type        = string
}

variable "azure_location" {
  description = "Primary Azure region (e.g. North Europe)"
  type        = string
  default     = "North Europe"
}

variable "aws_region" {
  description = "Secondary AWS region for compliance storage"
  type        = string
  default     = "eu-central-1"
}
