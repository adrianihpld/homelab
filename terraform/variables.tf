variable "proxmox_endpoint" {
  description = "URL of the Proxmox API"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token in the form 'user@realm!tokenid=secret'"
  type        = string
  sensitive   = true
}
