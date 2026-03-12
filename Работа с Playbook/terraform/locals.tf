locals {
  vm_clickhouse_full_name = "${var.vpc_name}-${var.vm_clickhouse_name}-${var.default_zone}"
  vm_vector_full_name  = "${var.vpc_name}-${var.vm_vector_name}-${var.default_zone}"
}