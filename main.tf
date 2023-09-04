terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}


resource "yandex_compute_instance" "vm-1" {
  name = "vm-1"
  hostname = "vm-1"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-a"

 resources {
    cores  = 2
    memory = 2
  }

 boot_disk {
    initialize_params {
      image_id = "fd81ojtctf7kjqa3au3i"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.test-a.id}"
    nat       = true
  }

  metadata = {
      user-data = "${file("./meta.txt")}"
    }
}


resource "yandex_compute_instance" "vm-2" {
  name = "vm-2"
  hostname = "vm-2"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81ojtctf7kjqa3au3i"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test-b.id
    nat       = true
  }

  metadata = {
      user-data = "${file("./meta.txt")}"
    }
}

resource "yandex_compute_instance" "vm-3" {
  name = "vm-3"
  hostname = "vm-3"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81ojtctf7kjqa3au3i"
      size = 6
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test-a.id
    nat       = true
  }

  metadata = {
      user-data = "${file("./meta.txt")}"
    }
}


resource "yandex_compute_instance" "vm-4" {
  name = "vm-4"
  hostname = "vm-4"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81ojtctf7kjqa3au3i"
      size = 6
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test-a.id
    nat       = true
  }

  metadata = {
      user-data = "${file("./meta.txt")}"
    }
}

resource "yandex_compute_instance" "vm-5" {
  name = "vm-5"
  hostname = "vm-5"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81ojtctf7kjqa3au3i"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test-b.id
    nat       = true
  }

  metadata = {
      user-data = "${file("./meta.txt")}"
    }
}
//
resource "yandex_compute_instance" "vm-6" {
  name = "vm-6"
  hostname = "vm-6"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81ojtctf7kjqa3au3i"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test-b.id
    nat       = true
  }

  metadata = {
      user-data = "${file("./meta.txt")}"
    }
}
//