# Playbook: ClickHouse, Vector, LightHouse

## Что делает playbook

Playbook разворачивает три сервиса на разных группах хостов:

- **ClickHouse**: добавляет репозиторий, устанавливает пакеты, перезапускает сервис, создаёт БД `logs`.
- **Vector**: скачивает и распаковывает архив, создаёт конфиг из шаблона, ставит systemd‑сервис и запускает.
- **LightHouse**: скачивает статику, настраивает nginx для отдачи UI и запускает веб‑сервер.

## Инвентори

Файл: `playbook/inventory/prod.yml`

Группы хостов:

- `clickhouse`
- `vector`
- `lighthouse`

## Параметры (переменные)

ClickHouse (`playbook/group_vars/clickhouse/vars.yml`):

- `clickhouse_version`
- `clickhouse_packages`

Vector (`playbook/group_vars/vector/vars.yml`):

- `vector_version`
- `vector_install_dir`
- `vector_config_dir`
- `vector_archive`
- `vector_download_url`

LightHouse (`playbook/group_vars/lighthouse/vars.yml`):

- `lighthouse_version`
- `lighthouse_repo`
- `lighthouse_archive`
- `lighthouse_download_url`
- `lighthouse_install_dir`
- `lighthouse_archive_dir`

## Запуск

Проверка кода:

```bash
ansible-lint site.yml
```

<img src="screens\1.png" alt="Alt text" title="1">

Проверка без изменений:

```bash
ansible-playbook -i inventory/prod.yml site.yml --check
```

<img src="screens\2.png" alt="Alt text" title="2">

Применение с diff:

```bash
ansible-playbook -i inventory/prod.yml site.yml --diff
```

<img src="screens\3.png" alt="Alt text" title="3">

Проверка идемпотентности:

```bash
ansible-playbook -i inventory/prod.yml site.yml --diff
```

<img src="screens\4.png" alt="Alt text" title="4">
