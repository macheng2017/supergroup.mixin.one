FROM golang:alpine AS supergroup_base
WORKDIR /go/app
COPY postgres ./

EXPOSE 7001

ENV HOST=0.0.0.0
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn,direct
# 交叉编译
# 使用pwd 命令知道了这个RUN 是在容器中执行的而不是在本地执行的，
# 这样就弄明白了为什么总是找不到main了，我应该在纸上写出几个问题再一一尝试
# 这样效率就高了
#RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main main.go
#RUN GOOS=linux GOARCH=amd64 go build comsumer.go .
ADD ./main .

#ADD consumer .
#CMD ["./main"]


#FROM gin_demo_base AS gin-demo-consumer
#WORKDIR /go/src/app
#CMD ["./consumer"]

FROM supergroup_base AS supergroup_message
EXPOSE 80
EXPOSE 443
WORKDIR /go/app
CMD ["./main","-config","/go/app/config.yaml","-service","message"]

FROM supergroup_base AS supergroup_api
WORKDIR /go/app
CMD ["./main","-config","/go/app/config.yaml","-service","http"]
#
#FROM mysql:5.7 AS mysql_base
#ADD ./doc/init.sql /docker-entrypoint-initdb.d
