resource "yandex_alb_target_group" "nginx-target" {
  name           = "nginx-target"

  target {
    subnet_id    = yandex_vpc_subnet.test-a.id
    ip_address   = "${resource.yandex_compute_instance.vm-1.network_interface.0.ip_address}"
  }

  target {
    subnet_id    = yandex_vpc_subnet.test-b.id
    ip_address   = "${resource.yandex_compute_instance.vm-2.network_interface.0.ip_address}"
  }
}

  resource "yandex_alb_backend_group" "bg-nginx" {
  name = "bg-nginx"

  http_backend {
    name             = "nginx-be"
    port             = 80
    target_group_ids = [yandex_alb_target_group.nginx-target.id]
    healthcheck {
      timeout          = "10s"
      interval         = "2s"
      healthcheck_port = 80
      http_healthcheck {
        path = "/"
      }
    }
  }
}


resource "yandex_alb_http_router" "nginx-rt" {
  name = "nginx-rt"
}

resource "yandex_alb_virtual_host" "nginx-vh" {
  name           = "nginx-vh"
  http_router_id = yandex_alb_http_router.nginx-rt.id
  route {
    name = "nginx-route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.bg-nginx.id
        timeout          = "60s"
      }
    }
  }
}

resource "yandex_alb_load_balancer" "nginx-balancer" {
  name       = "nginx-balancer"
  network_id = yandex_vpc_network.test.id

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.test-a.id
    }

    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.test-b.id
    }
  }

  listener {
    name = "nginx-listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.nginx-rt.id
      }
    }
  }
}
