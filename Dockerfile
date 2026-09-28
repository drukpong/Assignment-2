FROM ubuntu:22.04

WORKDIR /app

COPY app/diagnostic.sh /app/diagnostic.sh
COPY app/health-check.sh /app/health-check.sh

RUN apt-get update && \
    apt-get install -y iproute2 iputils-ping dnsutils procps util-linux && \
    chmod +x /app/diagnostic.sh /app/health-check.sh && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/app/diagnostic.sh"]
