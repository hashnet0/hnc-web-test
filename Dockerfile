FROM hnc-base:latest
LABEL name="hnc-web-test"
LABEL description="HashNet Container for testing web services"
LABEL maintainer="hashsploit <hashsploit@protonmail.com>"


# Install dependencies
RUN echo "Updating system ..." \
	&& apt-get update \
	&& echo "Installing dependencies ..." \
	&& apt-get install -y \
	nginx \
	php7.3-fpm \
	nodejs \
	npm


# Remove generated configs
RUN rm -rf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/* /var/www/*


# Copy file system
COPY fs/ /

# Configure PHP
RUN mkdir -p /run/php/ \
	&& touch /run/php/php7.3-fpm.sock


# Configure
RUN cd /etc/nginx/ \
	&& ln -s /etc/nginx/sites-available/site.local.conf /etc/nginx/sites-enabled/site.local.conf \
	&& ln -s /etc/nginx/sites-available/a.site.local.conf /etc/nginx/sites-enabled/a.site.local.conf \
	&& ln -s /etc/nginx/sites-available/b.site.local.conf /etc/nginx/sites-enabled/b.site.local.conf \
	&& openssl req -x509 -nodes \
		-newkey rsa:4096 \
		-keyout /etc/nginx/certs/site.local.key \
		-out /etc/nginx/certs/site.local.crt \
		-days 9999 \
		-subj "/C=US/ST=California/L=San Francisco/O=site.local/OU=Org/CN=site.local/emailAddress=site.local@localhost" \
	&& cd /srv/websocket \
	&& npm i


# Expose service
EXPOSE 80
EXPOSE 443


# Set image starting point
CMD ["bash", "/srv/launch.sh"]
