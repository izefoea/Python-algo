# 改用 Debian 基础镜像（更稳定的包管理）
FROM debian:bookworm-slim

# 安装基础工具（apt 国内源默认已加速）
RUN apt-get update && apt-get install -y \
    bash \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

# 复制所有文件到镜像（保留完整测试环境）
COPY . /app

# 设置工作目录
WORKDIR /app

# 启动命令
CMD ["bash", "-c", "echo 'Hello from Docker image' && ls -la /app"]
