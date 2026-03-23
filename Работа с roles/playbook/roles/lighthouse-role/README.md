# LightHouse Role

Устанавливает и настраивает LightHouse (UI для ClickHouse) и nginx.

## Что делает

- Устанавливает nginx
- Скачивает и распаковывает статические файлы LightHouse
- Настраивает nginx для отдачи UI
- Запускает nginx

## Переменные

### Defaults

- `lighthouse_version`: версия/ветка (по умолчанию `master`)
- `lighthouse_repo`: репозиторий LightHouse
- `lighthouse_archive`: имя архива
- `lighthouse_download_url`: URL архива
- `lighthouse_install_dir`: каталог установки (по умолчанию `/opt/lighthouse`)
- `lighthouse_archive_dir`: каталог распаковки
- `lighthouse_listen_port`: порт nginx (по умолчанию `80`)
- `lighthouse_server_name`: server_name (по умолчанию `_`)
- `lighthouse_nginx_conf_path`: путь к конфигу nginx

## Пример использования

```yaml
- name: Install LightHouse
  hosts: lighthouse
  become: true
  roles:
    - lighthouse-role
```