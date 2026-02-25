resource "yandex_compute_instance" "web" {
  count       = 2
  name        = "web-${count.index + 1}"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vms_resources.web.hdd_size
      type     = var.vms_resources.web.hdd_type
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true
  }

  metadata = local.metadata

  depends_on = [yandex_compute_instance.db]
}