resource "yandex_compute_instance" "jenkins-master" {
  name        = "jenkins-master"
  platform_id = var.vm_web_platform
  resources {
    cores         = 4
    memory        = 8
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
    image_id = "fd874d4jo8jbroqs6d7i"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${file("/home/ubuntu/.ssh/id_rsa.pub")}"
  }

}

resource "yandex_compute_instance" "jenkins-agent" {
  name        = "jenkins-agent"
  platform_id = var.vm_web_platform
  resources {
    cores         = 4
    memory        = 8
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
    image_id = "fd874d4jo8jbroqs6d7i"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${file("/home/ubuntu/.ssh/id_rsa.pub")}"
  }

}
