# ---------------------------------------------------------------------------------------------------------------------
# EC2 PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "instance_count" {
  description = "Number of proxy instances to create"
  type        = number
  default     = 3
}

variable "instance_type" {
  description = "Type of proxy instance"
  type        = string
  default     = "t3a.nano"
}

variable "instance_user" {
  description = "Username to SSH proxy instance"
  type        = string
  default     = "ubuntu"
}

# ---------------------------------------------------------------------------------------------------------------------
# SSH PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "ssh_key" {
  description = "SSH key name"
  type        = string
  default     = "goproxy_ec2"
}

variable "public_key_path" {
  description = "SSH public key location"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "SSH private key location"
  type        = string
  default     = "~/.ssh/id_rsa"
}

# ---------------------------------------------------------------------------------------------------------------------
# GOPROXY PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "proxy_type" {
  description = "Goproxy Mode"
  type        = string
  default     = "socks"
}

variable "proxy_port" {
  description = "Goproxy Port"
  type        = number
  default     = 46642
}

variable "proxy_user" {
  description = "Goproxy User"
  type        = string
  default     = ""
}

variable "proxy_password" {
  description = "Goproxy Password"
  type        = string
  default     = ""
}
