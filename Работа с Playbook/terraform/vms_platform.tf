# VM1 ----------------------------------------------------------

variable "vm_clickhouse_image" {
  type    = string
  default = "centos-7"
}

variable "vm_clickhouse_name" {
  type    = string
  default = "netology-clickhouse"
}

variable "vm_clickhouse_platform_id" {
  type    = string
  default = "standard-v2"
}
/*
variable "vm_web_cores" {
  type    = number
  default = 2
}


variable "vm_web_memory" {
  type    = number
  default = 1
}

variable "vm_web_core_fraction" {
  type    = number
  default = 5
}
*/
variable "vm_clickhouse_preemptible" {
  type    = bool
  default = true
}

# VM2----------------------------------------------------------------

variable "vm_vector_image" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_vector_name" {
  type    = string
  default = "netology-vector"
}

variable "vm_vector_platform_id" {
  type    = string
  default = "standard-v2"
}
/*
variable "vm_db_cores" {
  type    = number
  default = 2
}

variable "vm_db_memory" {
  type    = number
  default = 2
}

variable "vm_db_core_fraction" {
  type    = number
  default = 20
}
*/
variable "vm_vector_preemptible" {
  type    = bool
  default = true
}