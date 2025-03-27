# 使用 Alpine 基础镜像
FROM alpine:latest

# 关键修复：替换为国内镜像源（阿里云）
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 安装必要工具（合并更新与安装步骤）
RUN apk update && apk add --no-cache bash coreutils

# 复制所有文件到镜像（用于测试 secret leakage）
COPY . /app

# 设置工作目录
WORKDIR /app

# 启动命令
CMD ["bash", "-c", "echo 'Hello from Docker image' && ls -la /app"]
