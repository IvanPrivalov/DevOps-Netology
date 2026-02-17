###cloud vars


variable "cloud_id" {
  type        = string
  default = "b1gi8cgpj0e6mhavg1tu"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1gbvkdug8dq8vb7kiqf"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqqZVu4oq2L27d8Z18Gwhp1cpv12Gx5SURcHRV7YvZBngbzy2nCQlY1rw7eLQpXvh1FPv1WBJOQe6+b2sYP2OjiEzf5METm8szD/vnuj/P1OUMQnTZA/5P5e/P4AQAbO6hY0mtHGOJiuYcCbq444/li3697pHRFfu7d3k9vMFLOEtH+HbcRBbFhZbUvwA9ZAAloxm2CXljz2Dgbp8TTnHp8q6SshFkIEjJ8lF7f0j9wQmyALrFUAOMmrdwuW/PxMqnW0fG+A3oQq+10Yw/w4r3YiROETnOD7J+cs3v/xyQJ+D/iHWfOWCqpWN9O5scT5df3mA5YQE6+0k7eig4JW2fkYTgQ8dnhoUPhysto6z1MkC+bf+Rr1X/aQNaC7nnnDJoAVoRw8YUOx5q6Bqon3gh5oKJmfFAQFg/Edn2dI45s8Xk1W7OeFeFdCLJeRKpCgtdwcuwPqeyTQjXVb5ri7LRTqM2TfcjOK0ATnEEEUW1RDQQWFJ8L7Ifew3eW1aVWYE= ivan@ivan-Otus"
  description = "ssh-keygen -t ed25519"
}