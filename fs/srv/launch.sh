#!/bin/bash

# Start php7.3-fpm
nohup /usr/sbin/php-fpm7.3 &

# Start websocket server
cd /srv/websocket
nohup /usr/bin/node index.js &

# Start nginx
exec /usr/sbin/nginx -g "daemon off;"

