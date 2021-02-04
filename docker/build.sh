#!/bin/bash


# A simple script
# 交叉编译
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./docker/main main.go
echo "cross compiled"
# 每次启动 --build 重新 build 镜像


function foo() {
docker network create supergroup_net
docker-compose -f docker/docker-compose.yml up --build
}

foo &
#natMacOS &