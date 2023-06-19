#!/bin/bash

# Install buildx
# Post https://devdotnet.org/post/sborka-docker-konteinerov-dlya-arm-arhitekturi-ispolzuya-buildx/

# $ chmod +x buildx-tags.sh
# $ ./buildx-tags.sh

set -e

echo "Start BUILDX"

#:ubuntu
#latest ubuntu:22.04
#23.04
#22.10
#22.04
#20.04
#18.04
#16.04
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:22.04 -t devdotnetorg/openssh-server:ubuntu . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:23.04 -t devdotnetorg/openssh-server:ubuntu-23.04 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:22.10 -t devdotnetorg/openssh-server:ubuntu-22.10 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:22.04 -t devdotnetorg/openssh-server:ubuntu-22.04 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:20.04 -t devdotnetorg/openssh-server:ubuntu-20.04 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:18.04 -t devdotnetorg/openssh-server:ubuntu-18.04 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:16.04 -t devdotnetorg/openssh-server:ubuntu-16.04 . 

#:debian
#latest debian:12
#12
#11
#10
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=debian:12 -t devdotnetorg/openssh-server:debian . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=debian:12 -t devdotnetorg/openssh-server:debian-12 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=debian:11 -t devdotnetorg/openssh-server:debian-11 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=debian:10 -t devdotnetorg/openssh-server:debian-10 . 

#:alpine
#latest alpine:3.18
#3.18
#3.17
#3.16
#3.15
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=alpine:3.18 -t devdotnetorg/openssh-server:alpine . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=alpine:3.18 -t devdotnetorg/openssh-server:alpine-3.18 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=alpine:3.17 -t devdotnetorg/openssh-server:alpine-3.17 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=alpine:3.16 -t devdotnetorg/openssh-server:alpine-3.16 . 
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=alpine:3.15 -t devdotnetorg/openssh-server:alpine-3.15 . 

# RISC-V (riscv64)
#:ubuntu-riscv64
docker buildx build --platform linux/riscv64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=riscv64/ubuntu:22.04 -t devdotnetorg/openssh-server:ubuntu-riscv64 . 
#:debian-riscv64
docker buildx build --platform linux/riscv64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=riscv64/debian:sid -t devdotnetorg/openssh-server:debian-riscv64 . 
#:alpine-riscv64
docker buildx build --platform linux/riscv64 -f Dockerfile.alpine --build-arg IMAGE_VERSION=riscv64/alpine:edge -t devdotnetorg/openssh-server:alpine-riscv64 . 

#:latest ubuntu:22.04
docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -f Dockerfile.ubuntu --build-arg IMAGE_VERSION=ubuntu:22.04 -t devdotnetorg/openssh-server:latest . 

echo "BUILDX END"

