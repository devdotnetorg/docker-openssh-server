#!/bin/bash

# Install buildx
# Post https://devdotnet.org/post/sborka-docker-konteinerov-dlya-arm-arhitekturi-ispolzuya-buildx/

# $ chmod +x buildx-tags.sh
# $ ./buildx-tags.sh

set -e

echo "Start BUILDX"

#:ubuntu 16.04, 18.04, 20.04, 22.04, 23.10, 24.04
#:debian 10, 11, 12
for IMAGE_VERSION in ubuntu:16.04 ubuntu:18.04 ubuntu:20.04 ubuntu:22.04 ubuntu:23.10 ubuntu:24.04 debian:10 debian:11 debian:12
do
  #
  declare IMAGE_VERSION_2=$(echo "$IMAGE_VERSION" | tr : -)
  # build
  echo "BUILD image: ${IMAGE_VERSION}"
  docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=${IMAGE_VERSION} -t devdotnetorg/openssh-server:${IMAGE_VERSION_2} . --push
  #
done

#latest ubuntu:24.04
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:24.04 -t devdotnetorg/openssh-server:ubuntu . --push


#latest debian:12
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=debian:12 -t devdotnetorg/openssh-server:debian . --push

#:alpine 3.16, 3.17, 3.18, 3.19, 3.20
for IMAGE_VERSION in alpine:3.16 alpine:3.17 alpine:3.18 alpine:3.19 alpine:3.20
do
  #
  declare IMAGE_VERSION_2=$(echo "$IMAGE_VERSION" | tr : -)
  # build
  echo "BUILD image: ${IMAGE_VERSION}"
  docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=${IMAGE_VERSION} -t devdotnetorg/openssh-server:${IMAGE_VERSION_2} . --push
  #
done

#latest alpine:3.20
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=alpine:3.20 -t devdotnetorg/openssh-server:alpine . --push

# RISC-V (riscv64)
#:ubuntu-riscv64
docker buildx build --platform linux/riscv64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=riscv64/ubuntu:22.04 -t devdotnetorg/openssh-server:ubuntu-riscv64 . --push
#:debian-riscv64
docker buildx build --platform linux/riscv64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=riscv64/debian:sid -t devdotnetorg/openssh-server:debian-riscv64 . --push
#:alpine-riscv64
docker buildx build --platform linux/riscv64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=riscv64/alpine:edge -t devdotnetorg/openssh-server:alpine-riscv64 . --push

#:latest ubuntu:24.04
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:24.04 -t devdotnetorg/openssh-server:latest . --push

echo "BUILDX END"
