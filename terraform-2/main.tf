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

# resource "yandex_vpc_network" "app-network" {  
#   name = "reddit-app-network"
#   description = "otus-network"
# }

# resource "yandex_vpc_subnet" "app-subnet" {
#   name = "reddit-app-subnet"
#   zone = "ru-central1-a"
#   description = "local-network"
#   network_id = "${yandex_vpc_network.app-network.id}"
#   v4_cidr_blocks = [ "192.168.10.0/24" ]
# }

# resource "yandex_compute_instance" "otus" {
#   name = "otus-redit"  

#   resources {
#     cores         = 2
#     memory        = 2
#     core_fraction = 100
#   }

#   boot_disk {
#     initialize_params {      
#       image_id = var.image_id
#     }
#   }  
  
#   network_interface {
#     subnet_id = yandex_vpc_subnet.app-subnet.id
#     nat = true
#   }

#   metadata = {
#     ssh-keys = "ubuntu:${file(var.public_key_path)}"
#   }

#   connection {
#     type  = "ssh"
#     host  = yandex_vpc_subnet.app-subnet.id
#     user  = "ubuntu"
#     agent = false    
#     private_key = file(var.private_key)
#   }

#   provisioner "file" {
#     source      = "files/puma.service"
#     destination = "/tmp/puma.service"
#   }

#   provisioner "remote-exec" {
#     script = "files/deploy.sh"
#   }
# }