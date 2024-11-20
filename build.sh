docker run \
    --rm \
    --privileged \
    -v ~/.docker:/root/.docker \
    -v ~/local/dev/frstack/frstack:/data \
    ghcr.io/home-assistant/amd64-builder \
    --all \
    -t /data \
    --test
