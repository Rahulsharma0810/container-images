FROM oven/bun:1-debian

ARG ACLI_VERSION=1.3.18-stable
ARG TARGETARCH

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

RUN ARCH=$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/') && \
    curl -fsSL "https://acli.atlassian.com/linux/${ACLI_VERSION}/acli_${ACLI_VERSION}_linux_${ARCH}.tar.gz" \
    | tar -xz --strip-components=1 -C /usr/local/bin && \
    chmod +x /usr/local/bin/acli

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Proxy source mounted at runtime via volume
WORKDIR /proxy

EXPOSE 4100

ENTRYPOINT ["/entrypoint.sh"]
