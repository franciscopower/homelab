# Baby Buddy

## Allowing i-frames

Workaround if you're using the linuxserver image, it's the same trick that's done in the homeassistant addon. Be aware of the security implications.

add this to your `$configdir/nginx/site_confs/default.conf`:

```conf
proxy_hide_header x-frame-options;
```

within the location / block. So it goes from:

```conf
    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header Host $http_host;
        proxy_redirect off;
    }

```

to:

```conf
    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_hide_header x-frame-options; # X-Frame denied by default
    }
```
