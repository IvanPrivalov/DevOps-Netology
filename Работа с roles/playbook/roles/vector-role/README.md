# Vector Role

Устанавливает и настраивает Vector.

## Описание

Роль выполняет установку Vector из официального архива, настраивает конфигурационный файл и systemd‑сервис.

## Требования

- Ansible >= 2.16
- Поддерживаемые ОС: Ubuntu 22.04, Debian 11

## Переменные роли

Все переменные задаются в `defaults/main.yml` и могут быть переопределены.

| Переменная | Значение по умолчанию | Описание |
|---|---|---|
| `vector_version` | `0.38.0` | Версия Vector |
| `vector_install_dir` | `/opt/vector` | Каталог установки |
| `vector_config_dir` | `/etc/vector` | Каталог конфига |
| `vector_archive` | `vector-{{ vector_version }}-x86_64-unknown-linux-gnu.tar.gz` | Имя архива |
| `vector_download_url` | `https://packages.timber.io/vector/{{ vector_version }}/{{ vector_archive }}` | URL архива |
| `vector_extract_dir` | `{{ vector_install_dir }}/vector-{{ vector_version }}-x86_64-unknown-linux-gnu` | Каталог распаковки |
| `vector_symlink_path` | `/usr/bin/vector` | Путь к бинарнику |

## Использование

```yaml
- name: Install Vector
  hosts: vector
  become: true
  roles:
    - vector-role
```
