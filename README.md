# docker-ssh-tunnel
在Docker的alpine镜像中建立SSH隧道

Based on https://github.com/wichon/alpine-ssh-tunnel

## Build
```
docker build --no-cache -t [image-name]:latest .
```

## Usage
```
docker run -d -p [LocalPort]:[LocalPort] -e "LOCAL_PORT=[LocalPort]" -e "REMOTE_HOST=[RemoteHost]" -e "REMOTE_PORT=[RemotePort]" -e "SSH_USER=[SshUser]" -e "SSH_HOST=[SshHost]" -v [IdFile]:/app/ssh.pem:ro --name=tunnel [image-name]
```

## Usage via Docker-composer.yml
```
ssh-tunnel:
    image: "ssh-tunnel"
    restart: on-failure
    expose:
      - [LocalPort]
    environment:
      LOCAL_PORT: [LocalPort]
      REMOTE_HOST: [RemoteHost]
      REMOTE_PORT: [RemotePort]
      SSH_USER: [SshUser]
      SSH_HOST: [SshHost]
    volumes:
      - [IdFile]:/app/ssh.pem:ro
    networks:
      - backend
```
