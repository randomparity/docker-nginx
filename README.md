docker-nginx
============

Nginx daemon running in a container.

`nginx` runs with the HTTP RPC interface listening on TCP port `80`.

Quick-start
-----------

`docker run -d --restart always -h nginx --name nginx -v /etc/docker/nginx:/usr/share/nginx/html:ro -v /etc/localtime:/etc/localtime:ro -p 80:80 randomparity/docker-nginx:latest`

Then open `http://<docker host IP>:80` in a browser.
