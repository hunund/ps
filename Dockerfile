FROM alpine:3.20

# 安装 tzdata（可选）
RUN apk add --no-cache tzdata

# 下载 frps 最新版（这里用 v0.61.0 举例，可改成最新）
ADD https://github.com/fatedier/frp/releases/download/v0.61.0/frp_0.61.0_linux_amd64.tar.gz /tmp/frp.tar.gz

# 解压并移动 frps
RUN tar -xzf /tmp/frp.tar.gz -C /tmp && \
    mv /tmp/frp_0.61.0_linux_amd64/frps /usr/bin/frps && \
    rm -rf /tmp/*

# 拷贝启动脚本
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 暴露端口（内部端口）
EXPOSE 7000

ENTRYPOINT ["/entrypoint.sh"]
