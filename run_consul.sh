#!/bin/sh
exec /bin/consul agent -config-dir=/etc/consul.d -data-dir=/data -client=0.0.0.0 -join=$CONSUL_SERVER
