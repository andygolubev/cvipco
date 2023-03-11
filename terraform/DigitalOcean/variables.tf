variable "do_token" {
  description = "Digital Ocean token"
  type        = string
  default     = "TOKEN"
}

variable "droplet-image" {
  description = "image"
  type        = string
  default     = "ubuntu-22-10-x64" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type us-east-1
}

variable "droplet-size" {
  description = "Droplet size"
  type        = string
  default     = "s-1vcpu-512mb-10gb"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "fra1"
}