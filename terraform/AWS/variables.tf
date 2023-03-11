variable "ami" {
  description = "AMI"
  type        = string
  default     = "ami-0557a15b87f6559cf" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type us-east-1
}

variable "instance_type" {
  description = "EC2 size"
  type        = string
  default     = "t2.small"
}

