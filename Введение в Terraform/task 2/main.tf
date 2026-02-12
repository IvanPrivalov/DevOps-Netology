terraform {
  required_version = "~> 1.12.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.8"
    }
  }
}

provider "docker" {
  host = "ssh://ivan@158.160.226.93"
}

resource "random_password" "mysql_root" {
  length  = 16
  special = false
}

resource "random_password" "mysql_user" {
  length  = 16
  special = false
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  name  = "example_${random_password.mysql_user.result}"
  image = docker_image.mysql.image_id

  ports {
    internal = 3306
    external = 3306
    ip       = "127.0.0.1"
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.mysql_user.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}