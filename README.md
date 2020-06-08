# HashNet Container for testing the reverse proxy web server

This Docker image generates a few test websites for
testing the [hnc-web](https://github.com/hashnet0/hnc-web) service container.

- `site.local` is a basic virtual host with a Web Socket proxy test located in `/ws.html`.
- `a.site.local` is another virtual host.
- `b.site.local` is a php virtual host.

## Installation

### 1. Configure image

- Configure image in the `settings.sh` file.

### 2. Build the image

Run the `build.sh` file to generate the Docker image `hnc-web-test`.

### 2. Deploy the container

To spawn a temporary container run `test.sh`.
You can manually start the services via executing `/srv/launch.sh`.

To deploy a dedicated container run `deploy.sh`.

