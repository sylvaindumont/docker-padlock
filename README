Padlock is a minimalist open source password manager.

This image run a padlock sync server: https://github.com/MaKleSoft/padlock-cloud

## Behind a reverse proxy

```
docker run -p 127.0.0.1:9012:3000 --restart always --name padlock-server -e BASE_URL=<base-url> -d sylvaindumont/padlock
```

## Without a reverse proxy

```
docker run -p 443:3000 --restart always --name padlock-server -v <path-to-certs>:/etc/ssl/certs:ro ... -e BASE_URL=<base-url> -d sylvaindumont/padlock --tls-cert <path-to-cert> --tls-key <path-to-key>
```
