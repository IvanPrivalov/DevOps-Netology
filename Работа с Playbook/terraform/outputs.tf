output "vm_info" {
  description = "VM info"
  value = [
    "clickhouse: name=${yandex_compute_instance.platform.name}, ip=${yandex_compute_instance.platform.network_interface[0].nat_ip_address}, fqdn=${yandex_compute_instance.platform.fqdn}",
    "vector:  name=${yandex_compute_instance.platform_vector.name}, ip=${yandex_compute_instance.platform_vector.network_interface[0].nat_ip_address}, fqdn=${yandex_compute_instance.platform_vector.fqdn}"
  ]
}