# code-server Systemd Service

Two sets of files that do two things:
 - Automatically starting `code-server` when an endpoint is reached on an [openresty](https://github.com/openresty/lua-nginx-module#readme) server.
 - Automatically shutting down `code-server` when there have been no active connections for the last 10 minutes.

## Installing

### Autostart

```bash
$ git clone https://github.com/PietroCarrara/code-server-service.git
$ cd code-server-service
$ sudo vim /etc/openresty/nginx.conf # see this repo's nginx.conf and edit your own
$ sudo systemctl restart openresty.service
$ sudo vim code-server.service # Change the user who'll run the server
$ sudo cp code-server.service /etc/systemd/system/ # Install the start service
```

### Auto-Shutdown

```bash
$ vim code-server-autoshutdown.sh # Change the username of who'll be running code-server
$ sudo cp code-server-autoshutdown.sh /usr/bin/ # Install the autoshutdown script
$ sudo cp code-server-autoshutdown.timer /etc/systemd/system # Install the autoshutdown timer
$ sudo cp code-server-autoshutdown.service /etc/systemd/system # Install the autoshutdown service
$ sudo systemctl enable --now code-server-autoshutdown.timer # Enable the autoshutdown service
```