#!/bin/sh

if [ -z ${SSH_HOST+x} ]; then echo "Invalid argument to exit"; exit 128; fi

if [ ! -f /app/ssh.pem ]; then echo "ssh.pem not found!"; exit 12; fi

cp /app/ssh.pem /app/ssh_id_file
chmod 400 /app/ssh_id_file

ssh-keyscan $SSH_HOST >> ~/.ssh/known_hosts

ssh -i /app/ssh_id_file -nNT -o GatewayPorts=true -L $LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT $SSH_USER@$SSH_HOST
