terraform {
  # required_providers {
  #   yandex = {
  #     source = "yandex-cloud/yandex"
  #   }
  # }
  # required_version = ">= 0.13"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "mystate"
    region = "ru-central1-a"
    key    = "terraform.tfstate"
    access_key = "xxxx"
    secret_key = "xxxx"


    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  }
}

# provider "yandex" {
#   zone = "ru-central1-a"
# }

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  private_key     = var.private_key
  subnet_id       = var.subnet_id
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  private_key     = var.private_key
  subnet_id       = var.subnet_id
}