# vms

vms_resources = {
  web = {
    cores         = 2
    memory        = 1
    core_fraction = 5
    hdd_size      = 5
    hdd_type      = "network-hdd"
  }

  db = {
    cores         = 2
    memory        = 2
    core_fraction = 20
    hdd_size      = 5
    hdd_type      = "network-hdd"
  }
}

metadata = {
  serial-port-enable = "1"
  ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqqZVu4oq2L27d8Z18Gwhp1cpv12Gx5SURcHRV7YvZBngbzy2nCQlY1rw7eLQpXvh1FPv1WBJOQe6+b2sYP2OjiEzf5METm8szD/vnuj/P1OUMQnTZA/5P5e/P4AQAbO6hY0mtHGOJiuYcCbq444/li3697pHRFfu7d3k9vMFLOEtH+HbcRBbFhZbUvwA9ZAAloxm2CXljz2Dgbp8TTnHp8q6SshFkIEjJ8lF7f0j9wQmyALrFUAOMmrdwuW/PxMqnW0fG+A3oQq+10Yw/w4r3YiROETnOD7J+cs3v/xyQJ+D/iHWfOWCqpWN9O5scT5df3mA5YQE6+0k7eig4JW2fkYTgQ8dnhoUPhysto6z1MkC+bf+Rr1X/aQNaC7nnnDJoAVoRw8YUOx5q6Bqon3gh5oKJmfFAQFg/Edn2dI45s8Xk1W7OeFeFdCLJeRKpCgtdwcuwPqeyTQjXVb5ri7LRTqM2TfcjOK0ATnEEEUW1RDQQWFJ8L7Ifew3eW1aVWYE= ivan@ivan-Otus"
}