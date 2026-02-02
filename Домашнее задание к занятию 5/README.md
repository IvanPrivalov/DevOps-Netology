# Домашнее задание к занятию 5. «Практическое применение Docker»

### Инструкция к выполнению

1. Для выполнения заданий обязательно ознакомьтесь с [инструкцией](https://github.com/netology-code/devops-materials/blob/master/cloudwork.MD) по экономии облачных ресурсов. Это нужно, чтобы не расходовать средства, полученные в результате использования промокода.
3. **Своё решение к задачам оформите в вашем GitHub репозитории.**
4. В личном кабинете отправьте на проверку ссылку на .md-файл в вашем репозитории.
5. Сопроводите ответ необходимыми скриншотами.

---
## Примечание: Ознакомьтесь со схемой виртуального стенда [по ссылке](https://github.com/netology-code/shvirtd-example-python/blob/main/schema.pdf)

---

## Задача 1
1. Сделайте в своем GitHub пространстве fork [репозитория](https://github.com/netology-code/shvirtd-example-python).

2. Создайте файл ```Dockerfile.python``` на основе существующего `Dockerfile`:
   - Используйте базовый образ ```python:3.12-slim```
   - Обязательно используйте конструкцию ```COPY . .``` в Dockerfile
   - Создайте `.dockerignore` файл для исключения ненужных файлов
   - Используйте ```CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]``` для запуска
   - Протестируйте корректность сборки

```sh
FROM python:3.12-slim

WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

# Запускаем приложение с помощью uvicorn, делая его доступным по сети
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"] 
```

<img src="screens\image.png" alt="Alt text" title="buind shvirtd-example-python">

<img src="screens\image 2.png" alt="Alt text" title="run shvirtd-example-python">

3. (Необязательная часть, *) Изучите инструкцию в проекте и запустите web-приложение без использования docker, с помощью venv. (Mysql БД можно запустить в docker run).

<img src="screens\image 3.png" alt="Alt text" title="run venv shvirtd-example-python">

4. (Необязательная часть, *) Изучите код приложения и добавьте управление названием таблицы через ENV переменную.

<img src="screens\image 4.png" alt="Alt text" title="ENV">

---
### ВНИМАНИЕ!
!!! В процессе последующего выполнения ДЗ НЕ изменяйте содержимое файлов в fork-репозитории! Ваша задача ДОБАВИТЬ 5 файлов: ```Dockerfile.python```, ```compose.yaml```, ```.gitignore```, ```.dockerignore```,```bash-скрипт```. Если вам понадобилось внести иные изменения в проект - вы что-то делаете неверно!
---

## Задача 2 (*)
1. Создайте в yandex cloud container registry с именем "test" с помощью "yc tool" . [Инструкция](https://cloud.yandex.ru/ru/docs/container-registry/quickstart/?from=int-console-help)
2. Настройте аутентификацию вашего локального docker в yandex container registry.
3. Соберите и залейте в него образ с python приложением из задания №1.
4. Просканируйте образ на уязвимости.
5. В качестве ответа приложите отчет сканирования.

```sh
ivan@ivan-Otus:shvirtd-example-python$ yc container registry create --name test
done (1s)
id: crp7j0hnhfkl4sjpj90v
folder_id: b1gemsb55a6kk19rspnb
name: test
status: ACTIVE
created_at: "2026-02-02T10:18:21.059Z"

ivan@ivan-Otus:shvirtd-example-python$ yc container registry configure-docker
docker configured to use yc --profile "default" for authenticating "cr.yandex" container registries
Credential helper is configured in '/home/ivan/.docker/config.json'

ivan@ivan-Otus:shvirtd-example-python$ docker tag shvirtd-example-python cr.yandex/crp7j0hnhfkl4sjpj90v/shvirtd-example-python:latest
ivan@ivan-Otus:shvirtd-example-python$ docker images
                                                                                                                                                                   i Info →   U  In Use
IMAGE                                                          ID             DISK USAGE   CONTENT SIZE   EXTRA
127.0.0.1:5000/custom-nginx:latest                             7f2780f7285d        192MB             0B        
centos:7                                                       eeb6ee3f44bd        204MB             0B        
centos:8                                                       5d0da3dc9764        231MB             0B        
cr.yandex/crp7j0hnhfkl4sjpj90v/shvirtd-example-python:latest   cf83026464c9        320MB             0B        
debian:latest                                                  29d02fa8f9f4        120MB             0B        
localhost:5000/custom-nginx:latest                             7f2780f7285d        192MB             0B        
mysql:latest                                                   2aa51c1d154a        922MB             0B        
nginx:1.29.0                                                   7a073be66c4c        192MB             0B        
privalovip/custom-nginx:1.0.0                                  7f2780f7285d        192MB             0B        
shvirtd-example-python:latest                                  cf83026464c9        320MB             0B        
ivan@ivan-Otus:shvirtd-example-python$ docker push cr.yandex/crp7j0hnhfkl4sjpj90v/shvirtd-example-python:latest
The push refers to repository [cr.yandex/crp7j0hnhfkl4sjpj90v/shvirtd-example-python]
1844ccb166cf: Pushed 
eff128dc4814: Pushed 
75bd82086661: Pushed 
ece8da290d27: Pushed 
343fbb74dfa7: Pushed 
cfdc6d123592: Pushed 
ff565e4de379: Pushed 
e50a58335e13: Pushed 
latest: digest: sha256:377c8e8aff04519dba9876a35862e4685a88a462bac5b42abaa1aee20ab147b8 size: 1992

ivan@ivan-Otus:shvirtd-example-python$ yc container image list --repository-name=crp7j0hnhfkl4sjpj90v/shvirtd-example-python
+----------------------+---------------------+---------------------------------------------+--------+-----------------+
|          ID          |       CREATED       |                    NAME                     |  TAGS  | COMPRESSED SIZE |
+----------------------+---------------------+---------------------------------------------+--------+-----------------+
| crpjuvqf3do0m1dluqus | 2026-02-02 10:30:39 | crp7j0hnhfkl4sjpj90v/shvirtd-example-python | latest | 130.3 MB        |
+----------------------+---------------------+---------------------------------------------+--------+-----------------+

ivan@ivan-Otus:shvirtd-example-python$ yc container image scan crpjuvqf3do0m1dluqus
done (1m1s)
id: chedi4bv1jlfpkmrgluq
image_id: crpjuvqf3do0m1dluqus
scanned_at: "2026-02-02T10:40:09.435Z"
status: READY
vulnerabilities:
  critical: "3"
  high: "5"
  medium: "44"
  low: "51"

yc container image list-vulnerabilities --scan-result-id=chedi4bv1jlfpkmrgluq  
```

<img src="screens\image 5.png" alt="Alt text" title="scan">

<img src="screens\image 6.png" alt="Alt text" title="scan">

<img src="screens\image 7.png" alt="Alt text" title="scan">
