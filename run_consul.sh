#!/bin/sh
exec /bin/consul agent -config-dir=/etc/consul.d -data-dir=/data -join=$CONSUL_SERVER $CONSUL_ARGS
