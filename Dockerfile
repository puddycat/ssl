#
# home/ssl/Dockerfile
#
#   Create an SSL Docker image.
#
#   docker build -f Dockerfile  \
#       --build-arg OS_IMAGE="ubuntu" \
#       --build-arg OS_IMAGE_TAG="focal" \
#       -t raymondstrose/ssl:0.0.1 .
#

ARG	OS_IMAGE="ubuntu"
ARG	OS_IMAGE_TAG="focal"
ARG	DOCKER_ARCH="arm64"
ARG DEBIAN_FRONTEND=noninteractive

FROM $OS_IMAGE:$OS_IMAGE_TAG
LABEL MAINTAINER raymondstrose@hotmail.com

RUN apt-get update && apt-get install -y openssl && apt-get clean all

COPY /bin/setup-ca setup-ca

ENTRYPOINT ["setup-ca", "--debug", "--verbose"]
