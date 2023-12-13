# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*   
RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update && \
    apt-get install -y systemctl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# 设置 root 用户的密码为 'root'
RUN echo 'root:zhangzhao' | chpasswd

# 暴露 22 端口
EXPOSE 22
# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
CMD ["/usr/bin/sudo", "-t", "-s", "/:LOGIN"]
CMD ["/usr/bin/curl", "-t", "-s", "/:LOGIN"]
CMD ["/usr/bin/systemctl", "-t", "-s", "/:LOGIN"]
