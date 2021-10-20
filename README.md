# Nerv

## Pre-Requisites
Please install [docker](https://docs.docker.com/) on your machine. We use a docker wrapper to execute commands so the version is fixed.

#### Mac Install
```shell
$ brew install docker
```

#### Debian Install
```shell
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

This repository uses [direnv](https://direnv.net) automates adding the docker wrapper scripts  When you leave the directory, the PATH will be auto removed.
#### Linux install
```shell
$ curl -sfL https://direnv.net/install.sh | bash
$ echo 'eval "$(direnv hook ${YOUR_SHELL})"' >> ~/.${YOUR_SHELL}rc
$ source ~/.${YOUR_SHELL}rc
```
#### Mac install
```shell
$ brew install direnv
$ echo 'eval "$(direnv hook ${YOUR_SHELL})"' >> ~/.${YOUR_SHELL}rc
$ source ~/.${YOUR_SHELL}rc
```

## Setup
Load in the environment and path variables
```shell
$ direnv allow
```

## Start the database

If you allowed direnv, then
```shell
$ pg.sh 
```
> **Note**: You can just run `./scripts/pg.sh` too 