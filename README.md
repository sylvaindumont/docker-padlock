Padlock is a minimalist open source password manager.

This image run a padlock sync server: https://github.com/MaKleSoft/padlock-cloud

## Behind a reverse proxy

```
docker volume create --name padlock -v padlock:/db
docker run -p 127.0.0.1:9012:3000 --restart always --name padlock-server \
-e BASE_URL=<BASE_URL> -e NOTIFY_EMAIL=<NOTIFY_EMAIL> \
-e MAIL_SERVER=<MAIL_SERVER> -e MAIL_PORT=<MAIL_PORT> \
-e MAIL_USER=<MAIL_USER> -e MAIL_PASSWORD=<MAIL_PASSWORD> \
-d weboaks/padlock
```

## Without a reverse proxy

```
docker volume create --name padlock -v padlock:/db
docker run -p 443:3000 --restart always --name padlock-server \
-e BASE_URL=<BASE_URL> -e NOTIFY_EMAIL=<NOTIFY_EMAIL> \
-e MAIL_SERVER=<MAIL_SERVER> -e MAIL_PORT=<MAIL_PORT> \
-e MAIL_USER=<MAIL_USER> -e MAIL_PASSWORD=<MAIL_PASSWORD> \
-v <path-to-certs>:/etc/ssl/certs:ro  \
-d weboaks/padlock --tls-cert <path-to-cert> --tls-key <path-to-key>
```
