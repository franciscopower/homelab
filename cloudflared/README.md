# Cloudflared

This is the Cloudflare tunnel software

## Note on deploying the container

This container requires a `TUNNEL_TOKEN`, provided by Cloudflare. The environemnt variable must be set in the host:
```sh
export TUNNEL_TOKEN=asdfkljjasfjadkfja...
```

When deploying the container using `docker compose`, you need to allow the environemnt variables to be passed to *sudo*, by using the `-E` flag:
```sh
sudo -E docker compose up -d
```
