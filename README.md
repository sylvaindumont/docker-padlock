Padlock is a minimalist open source password manager.

This image run a padlock sync server: https://github.com/MaKleSoft/padlock-cloud

## Behind a reverse proxy

```
docker volume create --name padlock -v padlock:/db
docker run -p 127.0.0.1:9012:3000 --restart always --name padlock-server \
-e PC_BASE_URL=<BASE_URL> -e PC_NOTIFY_ERRORS=<NOTIFY_EMAIL> \
-e PC_EMAIL_PORT=<MAIL_SERVER> -e PC_EMAIL_PORT=<MAIL_PORT> \
-e PC_EMAIL_USER=<MAIL_USER> -e PC_EMAIL_PASSWORD=<MAIL_PASSWORD> \
-d weboaks/padlock
```

## Without a reverse proxy

```
docker volume create --name padlock -v padlock:/db
docker run -p 443:3000 --restart always --name padlock-server \
-e PC_BASE_URL=<BASE_URL> -e PC_NOTIFY_ERRORS=<NOTIFY_EMAIL> \
-e PC_EMAIL_PORT=<MAIL_SERVER> -e PC_EMAIL_PORT=<MAIL_PORT> \
-v <path-to-certs>:/etc/ssl/certs:ro  \
-e PC_EMAIL_USER=<MAIL_USER> -e PC_EMAIL_PASSWORD=<MAIL_PASSWORD> \
-d weboaks/padlock --tls-cert <path-to-cert> --tls-key <path-to-key>
```
