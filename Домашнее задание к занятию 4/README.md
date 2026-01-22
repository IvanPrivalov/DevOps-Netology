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
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker run -d --name privalovip-custom-nginx-t2 -p 127.0.0.1:8080:80 privalovip/custom-nginx:1.0.0
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

5. Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker exec -it custom-nginx-t2 bash
root@91bc53643e5e:/# cat /etc/*release
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```

6. Установите любимый текстовый редактор(vim, nano итд) с помощью apt-get.

```sh
root@91bc53643e5e:/# apt update
Get:1 http://deb.debian.org/debian bookworm InRelease [151 kB]
Get:2 http://deb.debian.org/debian bookworm-updates InRelease [55.4 kB]
Get:3 http://deb.debian.org/debian-security bookworm-security InRelease [48.0 kB]
Get:4 http://deb.debian.org/debian bookworm/main amd64 Packages [8792 kB]
Get:5 http://deb.debian.org/debian bookworm-updates/main amd64 Packages [6924 B]
Get:6 http://deb.debian.org/debian-security bookworm-security/main amd64 Packages [292 kB]
Fetched 9346 kB in 2s (5251 kB/s)                        
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
36 packages can be upgraded. Run 'apt list --upgradable' to see them.
root@91bc53643e5e:/# apt install nano
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libgpm2 libncursesw6
Suggested packages:
  gpm hunspell
The following NEW packages will be installed:
  libgpm2 libncursesw6 nano
0 upgraded, 3 newly installed, 0 to remove and 36 not upgraded.
Need to get 838 kB of archives.
After this operation, 3339 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://deb.debian.org/debian bookworm/main amd64 libncursesw6 amd64 6.4-4 [134 kB]
Get:2 http://deb.debian.org/debian bookworm/main amd64 nano amd64 7.2-1+deb12u1 [690 kB]
Get:3 http://deb.debian.org/debian bookworm/main amd64 libgpm2 amd64 1.20.7-10+b1 [14.2 kB]
Fetched 838 kB in 1s (1663 kB/s)   
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package libncursesw6:amd64.
(Reading database ... 7582 files and directories currently installed.)
Preparing to unpack .../libncursesw6_6.4-4_amd64.deb ...
Unpacking libncursesw6:amd64 (6.4-4) ...
Selecting previously unselected package nano.
Preparing to unpack .../nano_7.2-1+deb12u1_amd64.deb ...
Unpacking nano (7.2-1+deb12u1) ...
Selecting previously unselected package libgpm2:amd64.
Preparing to unpack .../libgpm2_1.20.7-10+b1_amd64.deb ...
Unpacking libgpm2:amd64 (1.20.7-10+b1) ...
Setting up libgpm2:amd64 (1.20.7-10+b1) ...
Setting up libncursesw6:amd64 (6.4-4) ...
Setting up nano (7.2-1+deb12u1) ...
update-alternatives: using /bin/nano to provide /usr/bin/editor (editor) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man1/editor.1.gz because associated file /usr/share/man/man1/nano.1.gz (of link group editor) doesn't exist
update-alternatives: using /bin/nano to provide /usr/bin/pico (pico) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man1/pico.1.gz because associated file /usr/share/man/man1/nano.1.gz (of link group pico) doesn't exist
Processing triggers for libc-bin (2.36-9+deb12u10) ...
root@91bc53643e5e:/# nano --version
 GNU nano, version 7.2
 (C) 2023 the Free Software Foundation and various contributors
 Compiled options: --disable-libmagic --enable-utf8
```

7. Отредактируйте файл "/etc/nginx/conf.d/default.conf", заменив порт "listen 80" на "listen 81".

```sh
root@91bc53643e5e:/# cat /etc/nginx/conf.d/default.conf | grep listen
    listen       81;
    listen  [::]:81;
    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
```

8. Запомните(!) и выполните команду nginx -s reload, а затем внутри контейнера curl http://127.0.0.1:80 ; curl http://127.0.0.1:81.

```sh
root@91bc53643e5e:/# nginx -s reload
2026/01/22 13:28:17 [notice] 211#211: signal process started
root@91bc53643e5e:/# curl http://127.0.0.1:80
curl: (7) Failed to connect to 127.0.0.1 port 80 after 0 ms: Couldn't connect to server
root@91bc53643e5e:/# curl http://127.0.0.1:81
<html>

<head>
    Hey, Netology
</head>

<body>
    <h1>I will be DevOps Engineer!</h1>
</body>
```

9. Выйдите из контейнера, набрав в консоли exit или Ctrl-D.

```sh
root@91bc53643e5e:/# exit
exit
ivan@ivan-Otus:Домашнее задание к занятию 4$
```

10. Проверьте вывод команд: ss -tlpn | grep 127.0.0.1:8080 , docker port custom-nginx-t2, curl http://127.0.0.1:8080. Кратко объясните суть возникшей проблемы.

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ ss -tlpn | grep 127.0.0.1:8080
LISTEN 0      4096       127.0.0.1:8080      0.0.0.0:*          
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker port custom-nginx-t2
80/tcp -> 127.0.0.1:8080
ivan@ivan-Otus:Домашнее задание к занятию 4$ curl http://127.0.0.1:8080
curl: (56) Recv failure: Connection reset by peer
```

Суть проблемы в том, что мы изменили порт в /etc/nginx/conf.d/default.conf на 81, а контейнер запущен с параметром связи с 80 портом ```sh sudo docker run -d --name privalovip-custom-nginx-t2 -p 127.0.0.1:8080:80 privalovip/custom-nginx:1.0.0```

11. Это дополнительное, необязательное задание. Попробуйте самостоятельно исправить конфигурацию контейнера, используя доступные источники в интернете. Не изменяйте конфигурацию nginx и не удаляйте контейнер. 

Останавливаем Docker и контейнер

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo systemctl stop docker
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker stop custom-nginx-t2
custom-nginx-t2
```

Редактируем файл hostconfig.json и config.v2.json контейнера по пути /var/lib/docker/containers/91bc53643e5efa5b965e85c3e525e58a75eb15d65b8ca124086b6f62aaa3effd/

#### hostconfig.json

```sh
"PortBindings": {
        "81/tcp": [
            {
                "HostIp": "127.0.0.1",
                "HostPort": "8080"
            }
        ]
    },
```

#### config.v2.json

```sh
"ExposedPorts": {
            "80/tcp": {},
            "81/tcp": {}
        },
```

Запускаем процесс Docker и контейнер.

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED        STATUS          PORTS                            NAMES
91bc53643e5e   privalovip/custom-nginx:1.0.0   "/docker-entrypoint.…"   30 hours ago   Up 14 seconds   80/tcp, 127.0.0.1:8080->81/tcp   custom-nginx-t2
```

Проверяем

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ curl http://127.0.0.1:8080
<html>

<head>
    Hey, Netology
</head>

<body>
    <h1>I will be DevOps Engineer!</h1>
</body>

</html>
```

12. Удалите запущенный контейнер "custom-nginx-t2", не останавливая его.

```sh
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker rm -f 91bc53643e5e
91bc53643e5e
ivan@ivan-Otus:Домашнее задание к занятию 4$ sudo docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
