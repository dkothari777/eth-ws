# Nerv

## Pre-Requisites
Please install [docker](https://docs.docker.com/) on your machine. We use a docker wrapper to execute commands so the version is fixed.

#### Mac Install
```shell
$ brew install --cask docker
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

## Eth-Stream
Streams Ethereum transactions from a websocket. You can accomplish this from the command line too. 

```shell
$ npm install -g wscat
$ wscat -c wss://main-light.eth.linkpool.io/ws
> {"id": 1, "method": "eth_subscribe", "params": ["newHeads"], "jsonrpc":"2.0"}
```
> Note: Future will stream directly to the database. Links taken from https://medium.com/linkpool/release-of-public-ethereum-rpcs-f5dd57455d2e

### Pre-Requisites
Install Rust and Cargo

#### Mac-Install
```shell
$ brew install rust
```

### Build
```shell
$ cd eth-stream
$ cargo build
$ cargo run
```


## Start the database

If you allowed direnv, then
```shell
$ pg up
```
> **Note**: You can just run `./scripts/pg up` too

### Connect to the Postgres Database locally
```shell
$ pgcli -h 127.0.0.1 -U postgres -d postgres
```
> **Note**: Postgres Password is just `postgres`

#### Other commands
```text
$ pg [ up | down | reset | start | stop | restart ]

    up - build image, start postgres container and load data into postgres
    down - stop container and remove container
    reset - stop container, remove container, build image, start postgres container and load data into postgres
    start - start an existing stopped container if one does not exist then bring one up
    stop - stop an existing running container
    restart - stop an existing running container, then start an existing stopped container if one does not exist then bring on
```
