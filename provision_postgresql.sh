#!/bin/bash

curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq postgresql-9.1 postgresql-client-9.1 postgresql-contrib-9.1 < /dev/null > /dev/n
ull

sudo -u postgres psql postgres -c "ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres'"

sudo -u postgres psql postgres -c "CREATE USER vagrant_user WITH ENCRYPTED PASSWORD 'vagrant_user'"
sudo -u postgres psql postgres -c "CREATE DATABASE vagrant OWNER vagrant_user"

sudo echo "listen_addresses = '*'" >> /etc/postgresql/9.1/main/postgresql.conf
sudo echo "logging_collector = on" >> /etc/postgresql/9.1/main/postgresql.conf

sudo service postgresql restart
