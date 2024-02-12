terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
}

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