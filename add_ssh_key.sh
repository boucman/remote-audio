#!/bin/sh
mkdir -p $1/root/.ssh/
cp -p ~/.ssh/id_rsa.pub $1/root/.ssh/authorized_keys
chmod 0600 $1/root/.ssh/authorized_keys
