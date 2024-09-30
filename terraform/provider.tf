terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "1.9.5"
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
#  service_account_key_file = file ("/home/ubuntu/Terraform2/key.json")
  service_account_key_file = ".authorized_key.json"
}
