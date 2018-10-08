#!env bash
DOCKER_TAG=$(sha256sum Dockerfile | awk '{print $1}')
DOCKER_IMAGE=${DOCKER_REGISTRY}${DOCKER_NAME}:${DOCKER_TAG}

docker pull ${DOCKER_IMAGE}
if [ $? != 0 ]; then
  docker build -t ${DOCKER_IMAGE} .
  echo docker push ${DOCKER_IMAGE}
fi
