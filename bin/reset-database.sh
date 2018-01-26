#!/bin/bash

docker-compose --file 'services/mysql/docker-compose.yml' down --volumes
docker-compose --file 'services/mysql/docker-compose.yml' up -d
docker-compose --file 'services/mysql/docker-compose.yml' logs -f 2> /dev/null

www/bin/console doctrine:schema:create
