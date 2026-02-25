output "vm_list" {
  description = "Список всех ВМ в виде словарей"
  value = concat(
    [
      for vm in yandex_compute_instance.web : {
        name = vm.name
        id = vm.id
        fqdn = vm.fqdn
      }
    ],
    [
      for key, vm in yandex_compute_instance.db : {
        name = vm.name
        id = vm.id
        fqdn = vm.fqdn
      }
    ]
  )
}