# Home Assistant

## Updating Home Assitant

```sh
sudo docker compose pull homeassistant
sudo docker compose up -d
```

## HACS - Home Assistant Community Store

### Installation:

```sh
sudo docker exec -it homeassistant bash
wget -O - https://get.hacs.xyz | bash -
```

## Integrations

### Home Connect (Bosch)

1. Created Developer account: https://developer.home-connect.com/applications
2. Registered application "Home Assistant"

