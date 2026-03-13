resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_clickhouse_image
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_clickhouse_full_name
  platform_id = var.vm_clickhouse_platform_id

  resources {
    cores         = var.vms_resources["clickhouse"].cores
    memory        = var.vms_resources["clickhouse"].memory
    core_fraction = var.vms_resources["clickhouse"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vms_resources["clickhouse"].hdd_size
      type     = var.vms_resources["clickhouse"].hdd_type
    }
  }

  scheduling_policy {
    preemptible = var.vm_clickhouse_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = var.metadata
}

# vm2 ----------------------------------------------------
data "yandex_compute_image" "ubuntu_vector" {
  family = var.vm_vector_image
}
resource "yandex_compute_instance" "platform_vector" {
  name        = local.vm_vector_full_name
  platform_id = var.vm_vector_platform_id

  resources {
    cores         = var.vms_resources["vector"].cores
    memory        = var.vms_resources["vector"].memory
    core_fraction = var.vms_resources["vector"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vms_resources["vector"].hdd_size
      type     = var.vms_resources["vector"].hdd_type
    }
  }

  scheduling_policy {
    preemptible = var.vm_vector_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = var.metadata
}