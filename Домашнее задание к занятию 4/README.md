# Домашнее задание к занятию 4

----

## Задача 1

1. Установил docker и docker compose plugin на свою linux рабочую станцию.

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ docker --version
Docker version 29.1.5, build 0e6fee6

ivan@ivan-Otus:Домашнее задание к занятию 4$ docker-compose --version
Docker Compose version v2.36.1

ivan@ivan-Otus:Домашнее задание к занятию 4$ systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: enabled)
     Active: active (running) since Wed 2026-01-21 12:41:04 +05; 1min 9s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 18200 (dockerd)
      Tasks: 12
     Memory: 25.8M (peak: 27.0M)
        CPU: 508ms
     CGroup: /system.slice/docker.service
             └─18200 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.201553884+05:00" level=info msg="Restoring containers: start."
Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.237125706+05:00" level=info msg="Deleting nftables IPv4 rules" error="exit status 1"
Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.250210771+05:00" level=info msg="Deleting nftables IPv6 rules" error="exit status 1"
Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.681590104+05:00" level=info msg="Loading containers: done."
Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.705574419+05:00" level=info msg="Docker daemon" commit=3b01d64 containerd-snapshotter=false storage-driver=overlay2 version=>
Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.706497409+05:00" level=info msg="Initializing buildkit"
Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.734841534+05:00" level=info msg="Completed buildkit initialization"
Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.740301224+05:00" level=info msg="Daemon has completed initialization"
Jan 21 12:41:04 ivan-Otus dockerd[18200]: time="2026-01-21T12:41:04.740407332+05:00" level=info msg="API listen on /run/docker.sock"
Jan 21 12:41:04 ivan-Otus systemd[1]: Started docker.service - Docker Application Container Engine.
```

2. Создал публичный репозиторий с именем "custom-nginx" на https://hub.docker.com

<img src="\image.png" alt="Alt text" title="публичный репозиторий">

3. Скачал образ nginx:1.29.0

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker pull nginx:1.29.0
1.29.0: Pulling from library/nginx
b1badc6e5066: Pull complete 
c5ada5e7d698: Pull complete 
9dbfe0b105c9: Pull complete 
dea1652b095a: Pull complete 
85003794a6a5: Pull complete 
fea7cebc499c: Pull complete 
856c000ad0ec: Pull complete 
Digest: sha256:3ab4ed065a1437cbbd45e65617b1285bdf6523c6bf56a121e00df41720e09a89
Status: Downloaded newer image for nginx:1.29.0
docker.io/library/nginx:1.29.0
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker images
                                                                                                                                                                             i Info →   U  In Use
IMAGE          ID             DISK USAGE   CONTENT SIZE   EXTRA
nginx:1.29.0   7a073be66c4c        192MB             0B        
```

4. Соберал и отправил созданный образ в свой dockerhub-репозитории c tag 1.0.0

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker build -t privalovip/custom-nginx:1.0.0 .
[sudo] password for ivan: 
[+] Building 1.2s (9/9) FINISHED                                                                                                                                                  docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                        0.0s
 => => transferring dockerfile: 187B                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/nginx:1.29.0                                                                                                                             0.0s
 => [internal] load .dockerignore                                                                                                                                                           0.0s
 => => transferring context: 2B                                                                                                                                                             0.0s
 => [1/4] FROM docker.io/library/nginx:1.29.0                                                                                                                                               0.1s
 => [internal] load build context                                                                                                                                                           0.1s
 => => transferring context: 142B                                                                                                                                                           0.0s
 => [2/4] RUN rm -rf /usr/share/nginx/html/*                                                                                                                                                0.3s
 => [3/4] COPY index.html /usr/share/nginx/html/                                                                                                                                            0.1s
 => [4/4] RUN chmod 644 /usr/share/nginx/html/index.html                                                                                                                                    0.5s
 => exporting to image                                                                                                                                                                      0.1s
 => => exporting layers                                                                                                                                                                     0.1s
 => => writing image sha256:7f2780f7285d1135ebba0cbeaf863372fbe5dd18cefdc8ce252cdb9b6ec630a1                                                                                                0.0s
 => => naming to docker.io/privalovip/custom-nginx:1.0.0       

ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker images
                                                                                                                                                                             i Info →   U  In Use
IMAGE                           ID             DISK USAGE   CONTENT SIZE   EXTRA
nginx:1.29.0                    7a073be66c4c        192MB             0B        
privalovip/custom-nginx:1.0.0   7f2780f7285d        192MB             0B

ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker push privalovip/custom-nginx:1.0.0
The push refers to repository [docker.io/privalovip/custom-nginx]
3ff0d41a5c24: Pushed 
7ed7e794490f: Pushed 
e0b314409d08: Pushed 
2e174fd56089: Mounted from library/nginx 
727839498dfa: Mounted from library/nginx 
508937af8963: Mounted from library/nginx 
e9b5d470f331: Mounted from library/nginx 
5e1b8f458cec: Mounted from library/nginx 
d89e58119fc7: Mounted from library/nginx 
eb5f13bce993: Mounted from library/nginx 
1.0.0: digest: sha256:4de9236e69b8255c6c1def54ab7f5310924d2923be004a40906b133a14e6a34d size: 2399
```

5. Ссылка на образ https://hub.docker.com/repository/docker/privalovip/custom-nginx/general

## Задача 2

1. Запустите ваш образ custom-nginx:1.0.0 командой docker run в соответвии с требованиями:

- имя контейнера "ФИО-custom-nginx-t2"
- контейнер работает в фоне
- контейнер опубликован на порту хост системы 127.0.0.1:8080


```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker run -d --name privalovip-custom-nginx-t2 -p
 127.0.0.1:8080:80 privalovip/custom-nginx:1.0.0
91bc53643e5efa5b965e85c3e525e58a75eb15d65b8ca124086b6f62aaa3effd
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                    NAMES
91bc53643e5e   privalovip/custom-nginx:1.0.0   "/docker-entrypoint.…"   19 seconds ago   Up 18 seconds   127.0.0.1:8080->80/tcp   privalovip-custom-nginx-t2
```

2. Не удаляя, переименуйте контейнер в "custom-nginx-t2"

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker rename privalovip-custom-nginx-t2 custom-nginx-t2

ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS         PORTS                    NAMES
91bc53643e5e   privalovip/custom-nginx:1.0.0   "/docker-entrypoint.…"   4 minutes ago   Up 4 minutes   127.0.0.1:8080->80/tcp   custom-nginx-t2
```

3. Выполните команду ```sh sudo date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; sudo docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; sudo docker logs custom-nginx-t2 -n1 ; sudo docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html ```

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; sudo docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; sudo docker logs custom-nginx-t2 -n1 ; sudo docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html
21-01-2026 15:21:10.687093147 +05
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                    NAMES
91bc53643e5e   privalovip/custom-nginx:1.0.0   "/docker-entrypoint.…"   36 minutes ago   Up 36 minutes   127.0.0.1:8080->80/tcp   custom-nginx-t2
LISTEN 0      4096       127.0.0.1:8080      0.0.0.0:*          
172.17.0.1 - - [21/Jan/2026:09:50:08 +0000] "GET / HTTP/1.1" 200 105 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
PGh0bWw+Cgo8aGVhZD4KICAgIEhleSwgTmV0b2xvZ3kKPC9oZWFkPgoKPGJvZHk+CiAgICA8aDE+
SSB3aWxsIGJlIERldk9wcyBFbmdpbmVlciE8L2gxPgo8L2JvZHk+Cgo8L2h0bWw+
```

<img src="\image 2.png" alt="Alt text" title="индекс-страница">

## Задача 3

1. Воспользуйтесь docker help или google, чтобы узнать как подключиться к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2".

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker attach 91bc53643e5e
172.17.0.1 - - [22/Jan/2026:11:45:16 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:11:45:21 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:11:45:22 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:11:45:22 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:11:45:22 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:11:45:22 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:11:45:23 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
```

2. Подключитесь к контейнеру и нажмите комбинацию Ctrl-C.

```sh
^C2026/01/22 11:46:25 [notice] 1#1: signal 2 (SIGINT) received, exiting
2026/01/22 11:46:25 [notice] 24#24: exiting
2026/01/22 11:46:25 [notice] 24#24: exit
2026/01/22 11:46:25 [notice] 22#22: exiting
2026/01/22 11:46:25 [notice] 22#22: exit
2026/01/22 11:46:25 [notice] 23#23: exiting
2026/01/22 11:46:25 [notice] 23#23: exit
2026/01/22 11:46:25 [notice] 25#25: exiting
2026/01/22 11:46:25 [notice] 25#25: exit
2026/01/22 11:46:25 [notice] 26#26: exiting
2026/01/22 11:46:25 [notice] 26#26: exit
2026/01/22 11:46:25 [notice] 27#27: exiting
2026/01/22 11:46:25 [notice] 27#27: exit
2026/01/22 11:46:25 [notice] 1#1: signal 17 (SIGCHLD) received from 22
2026/01/22 11:46:25 [notice] 1#1: worker process 22 exited with code 0
2026/01/22 11:46:25 [notice] 1#1: worker process 23 exited with code 0
2026/01/22 11:46:25 [notice] 1#1: worker process 24 exited with code 0
2026/01/22 11:46:25 [notice] 1#1: worker process 25 exited with code 0
2026/01/22 11:46:25 [notice] 1#1: worker process 26 exited with code 0
2026/01/22 11:46:25 [notice] 1#1: worker process 27 exited with code 0
2026/01/22 11:46:25 [notice] 1#1: exit
```

3. Выполните docker ps -a и объясните своими словами почему контейнер остановился.

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED        STATUS                      PORTS     NAMES
91bc53643e5e   privalovip/custom-nginx:1.0.0   "/docker-entrypoint.…"   26 hours ago   Exited (0) 27 seconds ago             custom-nginx-t2
```

Ctrl+C — последовательность клавиш, которая останавливает контейнер, она отправляет сигнал SIGINT (прерывание) в запущенный процесс внутри контейнера, который, по умолчанию, завершает работу контейнера. Сигнал SIGINT распространяется на основной процесс контейнера и убивает его. 

Использовать параметр --sig-proxy=false. Это гарантирует, что Ctrl+C не останавливает процесс в контейнере. Например, команда ```sh docker attach --sig-proxy=false ```

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker attach --sig-proxy=false 91bc53643e5e
172.17.0.1 - - [22/Jan/2026:12:08:09 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:12:08:10 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:12:08:10 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:12:08:10 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:12:08:10 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:12:08:10 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:12:08:11 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
172.17.0.1 - - [22/Jan/2026:12:08:11 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" "-"
^C
^C^C
got 3 SIGTERM/SIGINTs, forcefully exiting
ivan@ivan-Otus:Домашнее задание к занятию 4$ ^C
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED        STATUS         PORTS                    NAMES
91bc53643e5e   privalovip/custom-nginx:1.0.0   "/docker-entrypoint.…"   26 hours ago   Up 3 minutes   127.0.0.1:8080->80/tcp   custom-nginx-t2
```

4. Перезапустите контейнер

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker restart 91bc53643e5e
91bc53643e5e
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED        STATUS         PORTS                    NAMES
91bc53643e5e   privalovip/custom-nginx:1.0.0   "/docker-entrypoint.…"   26 hours ago   Up 4 seconds   127.0.0.1:8080->80/tcp   custom-nginx-t2
```

