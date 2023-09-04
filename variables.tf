variable "public_key_path" {
  description = "Path to public key file"
  default     = "/home/alexey/.ssh/id_rsa.pub"
}

variable "token" {
  description = "Yandex Cloud security OAuth token"
  default     = "***********************************************"
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID where resources will be created"
  default     = "**************************************************"
}

variable "cloud_id" {
  description = "Yandex Cloud ID where resources will be created"
  default     = "******************************************************"
} 