# Playbook: ClickHouse, Vector, LightHouse

## Описание

Репозиторий содержит playbook, который разворачивает:

- ClickHouse через роль `clickhouse` (из ansible-galaxy)
- Vector через роль `vector-role`
- LightHouse через роль `lighthouse-role`

## Роли

### ClickHouse

Источник: `git@github.com:AlexeySetevoi/ansible-clickhouse.git` (версия `1.13`)

Переменные роли задаются в `playbook/group_vars/clickhouse/vars.yml`:

- `clickhouse_version`
- `clickhouse_packages`

### Vector

Репозиторий: `https://github.com/IvanPrivalov/vector-role`

Переменные роли:

- `vector_version`
- `vector_install_dir`
- `vector_config_dir`
- `vector_archive`
- `vector_download_url`
- `vector_extract_dir`
- `vector_symlink_path`

### LightHouse

Репозиторий: `https://github.com/IvanPrivalov/lighthouse-role`

Переменные роли:

- `lighthouse_version`
- `lighthouse_repo`
- `lighthouse_archive`
- `lighthouse_download_url`
- `lighthouse_install_dir`
- `lighthouse_archive_dir`
- `lighthouse_listen_port`
- `lighthouse_server_name`
- `lighthouse_nginx_conf_path`

## Установка ролей

```bash
cd playbook
ansible-galaxy role install -r requirements.yml -p ./roles
```

## Запуск

```bash
ansible-playbook -i inventory/prod.yml site.yml --check
ansible-playbook -i inventory/prod.yml site.yml --diff
```
