variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "Free-tier friendly instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
  default     = "abir-free-tier-key"
}

variable "public_key_path" {
  description = "Path to your local SSH public key"
  type        = string
  default     = "/home/abir/.ssh/abir-free-tier-key.pub"
}
