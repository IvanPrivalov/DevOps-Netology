resource "yandex_compute_instance" "db" {
  for_each   = { for vm in var.each_vm : vm.vm_name => vm }
  name       = each.value.vm_name
  zone       = var.default_zone
  platform_id = "standard-v1"

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = each.value.hdd_size
      type     = each.value.hdd_type
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true
  }

  metadata = local.metadata
}