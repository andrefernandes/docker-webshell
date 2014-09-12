ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
# detect "docker" gid from host
GID=$(getent group docker | cut -d: -f3)
WEBPORT=${WEBPORT:-8022}
USERPWD=
echo "Will use $WEBPORT port"

docker run --rm -t -i -p $WEBPORT:8022 \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v /usr/bin/docker:/usr/bin/docker \
   -e GID=$GID \
   -e USERPWD=$USERPWD \
   andrefernandes/docker-webshell:latest $ENVBASH ${@:2}

