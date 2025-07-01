FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y curl gnupg ca-certificates gettext-base && \
    curl -fsSL https://repo.powerdns.com/FD380FBB-pub.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/pdns.gpg && \
    echo "deb http://repo.powerdns.com/debian bullseye-auth-47 main" > /etc/apt/sources.list.d/pdns.list && \
    apt-get update && \
    apt-get install -y pdns-server pdns-backend-mysql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY pdns.conf.template /etc/powerdns/pdns.conf.template

RUN chmod +x /entrypoint.sh

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["/entrypoint.sh"]
