alpine-telegraf-consul
======================

A base image using Alpine Linux + Runit to start both telegraf (telemetry) and a consul agent (service discovery). Generally, you'll add a run script for your service to /etc/service/yourservicename and set the CONSUL_SERVER value (or link a container called consul) and party on. I hope.