# Docker base image Ubuntu, Debian, Alpine with OpenSSH started

Support: amd64, aarch64 (ARM64v8), armhf (ARM32v7), RISC-V (riscv64).

[![Docker Stars](https://img.shields.io/docker/stars/devdotnetorg/openssh-server.svg?maxAge=2592000)](https://github.com/devdotnetorg/docker-openssh-server/) [![Docker pulls](https://img.shields.io/docker/pulls/devdotnetorg/openssh-server.svg)](https://github.com/devdotnetorg/docker-openssh-server/) [![GitHub last commit](https://img.shields.io/github/last-commit/devdotnetorg/docker-openssh-server/master)](https://github.com/devdotnetorg/docker-openssh-server/) [![GitHub Repo stars](https://img.shields.io/github/stars/devdotnetorg/docker-openssh-server)](https://github.com/devdotnetorg/docker-openssh-server/) 

Docker official Image Ubuntu, Debian, Alpine with sshd started. Password authentication.

#### Upstream Links

* Docker Registry @ [devdotnetorg/openssh-server](https://hub.docker.com/r/devdotnetorg/openssh-server)
* GitHub @ [devdotnetorg/docker-openssh-server](https://github.com/devdotnetorg/docker-openssh-server)

## Features

* SSH. Allow SSH connection to the container.
* Midnight Commander (Visual file manager).
* Text editors vim, nano, mcedit.
* Htop (an interactive process viewer for Unix).
* Network utilities such as ping, traceroute, nslookup, telnet, etc.

## Image Tags

Tags are defined by the mask: `devdotnetorg/openssh-server:<OS_name>-<OS_version>`. For example, the image `devdotnetorg/openssh-server:ubuntu-22.04` is built based on Ubuntu version 22.04.

Images for the following OS versions are builded:

* Ubuntu: 23.10, 22.04, 20.04, 18.04, 16.04;
* Debian: 12, 11, 10;
* Alpine: 3.19, 3.18, 3.17, 3.16.

### Tags for RISC-V (riscv64)

* `:ubuntu-riscv64` - Ubuntu 22.04;
* `:debian-riscv64` - Debian SID;
* `:alpine-riscv64` - Alpine edge.

## Quick Start
 
### Environment Variables
 
Set variable of password for root user:

`-e USER_PASSWORD=123456`

Run container with public port for connections is `2222`, password for user root is `654321`, volume `openssh-server-data` for transfer data in/out of container:

`$ docker run -d --name openssh-server -p 2222:22 -e USER_PASSWORD=654321 -v openssh-server-data:/data devdotnetorg/openssh-server:ubuntu`

For network is mynetwork:

`$ docker run -d --name openssh-server --net mynetwork --ip 172.18.0.20 -p 2222:22 -e USER_PASSWORD=654321 -v openssh-server-data:/data devdotnetorg/openssh-server:ubuntu`

docker-compose:

```yaml
version: '3.5'
services:
  openssh-server:
    image: devdotnetorg/openssh-server:ubuntu
    container_name: openssh-server
    environment:
      - USER_PASSWORD=654321
    volumes:
      - openssh-server-data:/data
    ports:
      - "2222:22"
    restart: always
    networks:
      mynetwork:
        ipv4_address: 172.18.0.20

volumes:
  openssh-server-data:
   name: openssh-server-data
   
networks:
  mynetwork:
    external: true
```

## Connect to container

Run Putty set you IP address and port `2222`

login `root`, password `654321`

## Shell

#### Midnight Commander (Visual file manager)

![Image of Midnight Commander](https://raw.githubusercontent.com/devdotnetorg/docker-openssh-server/master/screenshots/scr1-ubuntu-ssh.png)

Site: http://midnight-commander.org/

GNU Midnight Commander is a visual file manager, licensed under GNU General Public License and therefore qualifies as Free Software. It's a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included.

Start: `$ mc`

#### htop (an interactive process viewer for Unix)

![Image of htop](https://raw.githubusercontent.com/devdotnetorg/docker-openssh-server/master/screenshots/scr2-ubuntu-ssh.png)

Site: http://hisham.hm/htop/

This is htop, an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.

Start: `$ htop`

#### Net tools

![Net tools](https://raw.githubusercontent.com/devdotnetorg/docker-openssh-server/master/screenshots/scr3-ubuntu-ssh.png)
 
## Assembly for devices ##

The build for the amd64, aarch64 (ARM64v8), armhf (ARM32v7), RISC-V (riscv64) architecture was done using [buildx](https://github.com/docker/buildx).

Build script see [buildx-tags.sh](https://github.com/devdotnetorg/docker-openssh-server/blob/master/buildx-tags.sh).

## License ##

[MIT License](https://github.com/devdotnetorg/docker-openssh-server/blob/master/LICENSE).

## Need help?

If you have questions on how to use the image, please send mail to anton@devdotnet.org or visit the web-site [DevDotNet.ORG](https://devdotnet.org/).
