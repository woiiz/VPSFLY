FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    openssh-server \
    shellinabox \
    net-tools \
    curl \
    sudo && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "root:root" | chpasswd

RUN mkdir -p /var/run/sshd && \
    sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#Port .*/Port 22222/' /etc/ssh/sshd_config && \
    sed -i 's/^#\?UsePAM .*/UsePAM no/' /etc/ssh/sshd_config

EXPOSE 4200 22222

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
