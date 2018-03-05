#!/bin/sh

if [ -z ${SSH_HOST+x} ]; then echo "Invalid argument to exit"; exit 128; fi

ssh-keyscan $SSH_HOST >> ~/.ssh/known_hosts

ssh -i $ID_FILE -nNT -o GatewayPorts=true -L $LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT $SSH_USER@$SSH_HOST
