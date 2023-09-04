resource "yandex_vpc_network" "test" {
  name = "test"
}

resource "yandex_vpc_subnet" "test-a" {
  name           = "test-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.test.id
  v4_cidr_blocks = ["10.1.0.0/24"]
}

resource "yandex_vpc_subnet" "test-b" {
  name           = "test-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.test.id
  v4_cidr_blocks = ["10.1.1.0/24"]
}