## Docker

```bash
docker --version

docker container ls  # all running conteiners
docker container ls -a  # all running and stopped
docker container run nginx
docker container stop container_id
docker container rm container_id  # remove container
docker container rm -f container_id  # remove forcefully

docker image ls
docker image pull image_name
docker image rm image_name
```

### download image
```bash
docker pull user-id/image-name
```

### Dockerfile
```bash
docker build -t getting-started .
```

#### run
```bash
docker run -dp 3000:3000 getting-started
docker run --rm -dp 3000:3000 getting-started  # Automatically remove the container when it exits

docker container run -d -p 80:80 nginx
docker run -d -p 80:80 docker/getting-started
```

## info
```bash
docker ps  # get info
```