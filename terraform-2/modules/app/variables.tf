variable "public_key_path" {
  description = "Path key"
}
variable "private_key" {
  description = "Privat key"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "subnet_id" {
  description = "Inet"
}
