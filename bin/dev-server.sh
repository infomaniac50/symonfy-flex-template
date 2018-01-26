#!/bin/bash

trap 'kill -SIGINT %1; kill -SIGINT %2' SIGINT

www/bin/console server:run & yarn run encore dev-server --port 8001 &

wait
