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
    access_key = "YCAJEK1-EYQyLKVX6EemKhQQG"
    secret_key = "YCPoI3n0cwT-o5T8CMGD7WmW9ImwrWiTRe0bK0oF"


    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  }
}
