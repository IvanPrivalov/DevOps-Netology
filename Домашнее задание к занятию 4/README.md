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

## Задача 4

1. Запустите первый контейнер из образа centos c любым тегом в фоновом режиме, подключив папку текущий рабочий каталог $(pwd) на хостовой машине в /data контейнера, используя ключ -v.

```sh
ivan@ivan-Otus:data$ docker run -d -t -i -v $(pwd):/data centos:8 /bin/bash
b427d0afdbbc6a6c24ef910023d29c8875b9485a9325eae39bafac0cfefaf9de
ivan@ivan-Otus:data$ docker ps -a
CONTAINER ID   IMAGE      COMMAND       CREATED         STATUS         PORTS     NAMES
b427d0afdbbc   centos:8   "/bin/bash"   3 seconds ago   Up 2 seconds             modest_leavitt
```

2. Запустите второй контейнер из образа debian в фоновом режиме, подключив текущий рабочий каталог $(pwd) в /data контейнера.

```sh
ivan@ivan-Otus:data$ docker run -d -t -i -v $(pwd):/data debian:latest /bin/bash
Unable to find image 'debian:latest' locally
latest: Pulling from library/debian
2ca1bfae7ba8: Pull complete 
Digest: sha256:5cf544fad978371b3df255b61e209b373583cb88b733475c86e49faa15ac2104
Status: Downloaded newer image for debian:latest
5aae9330a86684b8f3c16eef63d9746143c99a6db4b240c5cfca715d17f061df
ivan@ivan-Otus:data$ docker ps -a
CONTAINER ID   IMAGE           COMMAND       CREATED          STATUS          PORTS     NAMES
5aae9330a866   debian:latest   "/bin/bash"   11 seconds ago   Up 11 seconds             happy_grothendieck
b427d0afdbbc   centos:8        "/bin/bash"   48 minutes ago   Up 48 minutes             modest_leavitt
```

3. Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data.

```sh
ivan@ivan-Otus:data$ docker exec -it modest_leavitt bash
[root@b427d0afdbbc /]# cd /data/
[root@b427d0afdbbc data]# touch filefromcentos
[root@b427d0afdbbc data]# ls
filefromcentos
```

4. Добавьте ещё один файл в текущий каталог $(pwd) на хостовой машине.

```sh
ivan@ivan-Otus:data$ ll
total 8
drwxrwxr-x 2 ivan ivan 4096 Jan 23 15:50 ./
drwxrwxr-x 6 ivan ivan 4096 Jan 23 14:48 ../
-rw-r--r-- 1 root root    0 Jan 23 15:50 filefromcentos
ivan@ivan-Otus:data$ touch filefromhost
ivan@ivan-Otus:data$ ll
total 8
drwxrwxr-x 2 ivan ivan 4096 Jan 23 15:51 ./
drwxrwxr-x 6 ivan ivan 4096 Jan 23 14:48 ../
-rw-r--r-- 1 root root    0 Jan 23 15:50 filefromcentos
-rw-rw-r-- 1 ivan ivan    0 Jan 23 15:51 filefromhost
```

5. Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.

```sh
ivan@ivan-Otus:data$ docker exec -it happy_grothendieck bash
root@5aae9330a866:/# cd /data/
root@5aae9330a866:/data# ls
filefromcentos  filefromhost
```

## Задача 5

1. Создайте отдельную директорию(например /tmp/netology/docker/task5) и 2 файла внутри него "compose.yaml" и "docker-compose.yaml". И выполните команду "docker compose up -d". Какой из файлов был запущен и почему?

```sh
ivan@ivan-Otus:data$ docker compose up -d
WARN[0000] Found multiple config files with supported names: /home/ivan/Desktop/DevOps-Netology/data/compose.yaml, /home/ivan/Desktop/DevOps-Netology/data/docker-compose.yaml 
WARN[0000] Using /home/ivan/Desktop/DevOps-Netology/data/compose.yaml 
WARN[0000] /home/ivan/Desktop/DevOps-Netology/data/compose.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] up 7/9
[+] up 10/10tainer/portainer-ce:latest [⣿⣿⣿⣿⣿⣿⣿⣿] 59.49MB / 59.49MB Pulling                                                                                                                 6.1s 
 ✔ Image portainer/portainer-ce:latest Pulled                                                                                                                                               6.1s 
   ✔ 09866042805c                      Pull complete                                                                                                                                        0.8s 
   ✔ 8e6d62697c09                      Pull complete                                                                                                                                        0.8s 
   ✔ 97d46cc86f33                      Pull complete                                                                                                                                        1.5s 
   ✔ 1b6da1229ec5                      Pull complete                                                                                                                                        1.6s 
   ✔ 37dcf0e5163d                      Pull complete                                                                                                                                        3.0s 
   ✔ 5f39d7b36694                      Pull complete                                                                                                                                        3.3s 
   ✔ 4dc5fe4c57e2                      Pull complete                                                                                                                                        3.3s 
   ✔ 4f4fb700ef54                      Pull complete                                                                                                                                        3.3s 
 ✔ Container data-portainer-1          Created                                                                                                                                              0.2s 
ivan@ivan-Otus:data$ docker ps -a
CONTAINER ID   IMAGE                           COMMAND        CREATED         STATUS         PORTS     NAMES
e26f93ac467e   portainer/portainer-ce:latest   "/portainer"   4 seconds ago   Up 3 seconds             data-portainer-1
```

Был запущен compose.yaml так как compose.yaml предпочтителен, если в каталоге два файла compose.yaml и docker-compose.yaml, compose выполнит compose.yaml.

2. Отредактируйте файл compose.yaml так, чтобы были запущенны оба файла.

```sh
include:
  - docker-compose.yaml
services:
  portainer:
    network_mode: host
    image: portainer/portainer-ce:latest
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

Выполнение compose.yaml

```sh
ivan@ivan-Otus:data$ docker compose up -d
WARN[0000] Found multiple config files with supported names: /home/ivan/Desktop/DevOps-Netology/data/compose.yaml, /home/ivan/Desktop/DevOps-Netology/data/docker-compose.yaml 
WARN[0000] Using /home/ivan/Desktop/DevOps-Netology/data/compose.yaml 
[+] up 5/6
[+] up 9/9egistry:2 [⣿⣿⣿⣿⣿] 10.12MB / 10.12MB Pulling                                                                                                                                       4.9s 
 ✔ Image registry:2           Pulled                                                                                                                                                        4.9s 
   ✔ 44cf07d57ee4             Pull complete                                                                                                                                                 1.3s 
   ✔ bbbdd6c6894b             Pull complete                                                                                                                                                 1.5s 
   ✔ 8e82f80af0de             Pull complete                                                                                                                                                 1.6s 
   ✔ 3493bf46cdec             Pull complete                                                                                                                                                 1.9s 
   ✔ 6d464ea18732             Pull complete                                                                                                                                                 2.1s 
 ✔ Network data_default       Created                                                                                                                                                       0.0s 
 ✔ Container data-registry-1  Created                                                                                                                                                       0.1s 
 ✔ Container data-portainer-1 Created                                                                                                                                                       0.1s 
ivan@ivan-Otus:data$ docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS         PORTS                                         NAMES
beb8c9089444   portainer/portainer-ce:latest   "/portainer"             9 seconds ago   Up 8 seconds                                                 data-portainer-1
deb7ebdd7068   registry:2                      "/entrypoint.sh /etc…"   9 seconds ago   Up 8 seconds   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp   data-registry-1
```

3. Выполните в консоли вашей хостовой ОС необходимые команды чтобы залить образ custom-nginx как custom-nginx:latest в запущенное вами, локальное registry.

```sh
ivan@ivan-Otus:data$ docker tag privalovip/custom-nginx:1.0.0 localhost:5000/custom-nginx:latest
ivan@ivan-Otus:data$ docker push localhost:5000/custom-nginx:latest
The push refers to repository [localhost:5000/custom-nginx]
3ff0d41a5c24: Pushed 
7ed7e794490f: Pushed 
e0b314409d08: Pushed 
2e174fd56089: Pushed 
727839498dfa: Pushed 
508937af8963: Pushed 
e9b5d470f331: Pushed 
5e1b8f458cec: Pushed 
d89e58119fc7: Pushed 
eb5f13bce993: Pushed 
latest: digest: sha256:683168320de76558e958f7ebb13b4e919846ab37e6fe87e3a44245c58c4c8653 size: 2399
ivan@ivan-Otus:data$ docker images
                                                                                                                                                                             i Info →   U  In Use
IMAGE                                ID             DISK USAGE   CONTENT SIZE   EXTRA
centos:7                             eeb6ee3f44bd        204MB             0B        
centos:8                             5d0da3dc9764        231MB             0B        
debian:latest                        29d02fa8f9f4        120MB             0B        
localhost:5000/custom-nginx:latest   7f2780f7285d        192MB             0B        
nginx:1.29.0                         7a073be66c4c        192MB             0B        
portainer/portainer-ce:latest        2622931a6f42        184MB             0B    U   
privalovip/custom-nginx:1.0.0        7f2780f7285d        192MB             0B        
registry:2                           26b2eb03618e       25.4MB             0B    U   
```

4. Откройте страницу "https://127.0.0.1:9000" и произведите начальную настройку portainer.

<img src="\image 3.png" alt="Alt text" title="portainer">

5. Откройте страницу "http://127.0.0.1:9000/#!/home", выберите ваше local окружение. Перейдите на вкладку "stacks" и в "web editor" задеплойте следующий компоуз:

```sh
version: '3'

services:
  nginx:
    image: 127.0.0.1:5000/custom-nginx
    ports:
      - "9090:80"
```

<img src="\image 4.png" alt="Alt text" title="stacks">

<img src="\image 5.png" alt="Alt text" title="stacks">

6. Перейдите на страницу "http://127.0.0.1:9000/#!/2/docker/containers", выберите контейнер с nginx и нажмите на кнопку "inspect". В представлении <> Tree разверните поле "Config" и сделайте скриншот от поля "AppArmorProfile" до "Driver".

<img src="\image 6.png" alt="Alt text" title="stacks">

7. Удалите любой из манифестов компоуза(например compose.yaml). Выполните команду "docker compose up -d". Прочитайте warning, объясните суть предупреждения и выполните предложенное действие. Погасите compose-проект ОДНОЙ(обязательно!!) командой.

```sh
ivan@ivan-Otus:data$ docker compose up -d
WARN[0000] No services to build                         
WARN[0000] Found orphan containers ([data-portainer-1]) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up. 
[+] up 1/1
 ✔ Container data-registry-1 Running  

ivan@ivan-Otus:data$ docker compose up -d --remove-orphans
WARN[0000] No services to build                         
[+] up 2/2
 ✔ Container data-portainer-1 Removed                                                                                                                                                       0.1s 
 ✔ Container data-registry-1  Running                                                                                                                                                       0.0s 
ivan@ivan-Otus:data$ docker ps -a
CONTAINER ID   IMAGE                         COMMAND                  CREATED          STATUS          PORTS                                         NAMES
71e25ab312fc   127.0.0.1:5000/custom-nginx   "/docker-entrypoint.…"   13 minutes ago   Up 13 minutes   0.0.0.0:9090->80/tcp, [::]:9090->80/tcp       nginx-nginx-1
deb7ebdd7068   registry:2                    "/entrypoint.sh /etc…"   39 minutes ago   Up 39 minutes   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp   data-registry-1

ivan@ivan-Otus:data$ docker compose down --remove-orphans
[+] down 2/2
 ✔ Container data-registry-1 Removed                                                                                                                                                        0.2s 
 ✔ Network data_default      Removed   
```