#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ./settings.sh

docker run --rm -i -t \
	-e CONTAINER_NAME=${CONTAINER_NAME} \
	-e NETWORK_ACCESS=internal \
	-e VIRTUAL_HOST=site.local,a.site.local,b.site.local \
	-e VIRTUAL_PORT=80,443 \
	--memory=${MEMORY_MAX} \
	--memory-swap=${MEMORY_MAX} \
	--memory-swappiness="0" \
	${IMAGE_NAME} bash

