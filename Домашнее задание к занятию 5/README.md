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

## Задача 3
1. Изучите файл "proxy.yaml"
2. Создайте в репозитории с проектом файл ```compose.yaml```. С помощью директивы "include" подключите к нему файл "proxy.yaml".
3. Опишите в файле ```compose.yaml``` следующие сервисы: 

- ```web```. Образ приложения должен ИЛИ собираться при запуске compose из файла ```Dockerfile.python``` ИЛИ скачиваться из yandex cloud container registry(из задание №2 со *). Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.5```. Сервис должен всегда перезапускаться в случае ошибок.
Передайте необходимые ENV-переменные для подключения к Mysql базе данных по сетевому имени сервиса ```web``` 

- ```db```. image=mysql:8. Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.10```. Явно перезапуск сервиса в случае ошибок. Передайте необходимые ENV-переменные для создания: пароля root пользователя, создания базы данных, пользователя и пароля для web-приложения.Обязательно используйте уже существующий .env file для назначения секретных ENV-переменных!

2. Запустите проект локально с помощью docker compose , добейтесь его стабильной работы: команда ```curl -L http://127.0.0.1:8090``` должна возвращать в качестве ответа время и локальный IP-адрес. Если сервисы не стартуют воспользуйтесь командами: ```docker ps -a ``` и ```docker logs <container_name>``` . Если вместо IP-адреса вы получаете информационную ошибку --убедитесь, что вы шлете запрос на порт ```8090```, а не 5000.

5. Подключитесь к БД mysql с помощью команды ```docker exec -ti <имя_контейнера> mysql -uroot -p<пароль root-пользователя>```(обратите внимание что между ключем -u и логином root нет пробела. это важно!!! тоже самое с паролем) . Введите последовательно команды (не забываем в конце символ ; ): ```show databases; use <имя вашей базы данных(по-умолчанию virtd, как это указано в .env)>; show tables; SELECT * from requests LIMIT 10;```. Примечание: таблица в БД создается после первого поступившего запроса к приложению.

6. Остановите проект. В качестве ответа приложите скриншот sql-запроса.

---
## Файл compose.yaml доступен [по ссылке](https://github.com/IvanPrivalov/shvirtd-example-python/blob/main/compose.yaml)

---

```sh
ivan@ivan-Otus:shvirtd-example-python$ docker compose up -d
WARN[0000] /home/ivan/Desktop/shvirtd-example-python/proxy.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] up 24/24
 ✔ Image nginx:latest Pulled                                                                                                                                                   11.0s 
 ✔ Image mysql:8      Pulled                                                                                                                                                   24.3s 
 ✔ Image haproxy:2.4  Pulled                                                                                                                                                   12.7s 
[+] Building 6.0s (13/13) FINISHED                                                                                                                                                   
 => [internal] load local bake definitions                                                                                                                                      0.0s
 => => reading from stdin 559B                                                                                                                                                  0.0s
 => [internal] load build definition from Dockerfile.python                                                                                                                     0.0s
 => => transferring dockerfile: 340B                                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                                                                             1.3s
 => [auth] library/python:pull token for registry-1.docker.io                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                                               0.0s
 => => transferring context: 166B                                                                                                                                               0.0s
 => [1/5] FROM docker.io/library/python:3.12-slim@sha256:5e2dbd4bbdd9c0e67412aea9463906f74a22c60f89eb7b5bbb7d45b66a2b68a6                                                       0.0s
 => [internal] load build context                                                                                                                                               2.3s
 => => transferring context: 161.78MB                                                                                                                                           2.3s
 => CACHED [2/5] WORKDIR /app                                                                                                                                                   0.0s
 => CACHED [3/5] COPY requirements.txt ./                                                                                                                                       0.0s
 => CACHED [4/5] RUN pip install -r requirements.txt                                                                                                                            0.0s
 => [5/5] COPY . .                                                                                                                                                              1.5s
 => exporting to image                                                                                                                                                          0.6s
[+] up 30/30ting layers                                                                                                                                                         0.6s
 ✔ Image nginx:latest                               Pulled                                                                                                                     11.0s 
 ✔ Image mysql:8                                    Pulled                                                                                                                     24.3s 
 ✔ Image haproxy:2.4                                Pulled                                                                                                                     12.7s 
 ✔ Image shvirtd-example-python-web                 Built                                                                                                                       6.1s 
 ✔ Network shvirtd-example-python_backend           Created                                                                                                                     0.1s 
 ✔ Container shvirtd-example-python-reverse-proxy-1 Created                                                                                                                     0.1s 
 ✔ Container shvirtd-example-python-ingress-proxy-1 Created                                                                                                                     0.1s 
 ✔ Container db                                     Healthy                                                                                                                    16.1s 
 ✔ Container web                                    Created
                                                                                                                      0.0s 
ivan@ivan-Otus:shvirtd-example-python$ docker compose ps
WARN[0000] /home/ivan/Desktop/shvirtd-example-python/proxy.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
NAME                                     IMAGE                        COMMAND                  SERVICE         CREATED          STATUS                    PORTS
db                                       mysql:8                      "docker-entrypoint.s…"   db              45 seconds ago   Up 44 seconds (healthy)   3306/tcp, 33060/tcp
shvirtd-example-python-ingress-proxy-1   nginx:latest                 "/docker-entrypoint.…"   ingress-proxy   45 seconds ago   Up 44 seconds             
shvirtd-example-python-reverse-proxy-1   haproxy:2.4                  "docker-entrypoint.s…"   reverse-proxy   45 seconds ago   Up 44 seconds             127.0.0.1:8080->8080/tcp
web                                      shvirtd-example-python-web   "uvicorn main:app --…"   web             45 seconds ago   Up 28 seconds  

ivan@ivan-Otus:shvirtd-example-python$ curl -L http://127.0.0.1:8090
"TIME: 2026-02-02 12:11:31, IP: 127.0.0.1"
```

<img src="screens\image 8.png" alt="Alt text" title="compose">

<img src="screens\image 9.png" alt="Alt text" title="db">