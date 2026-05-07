# Kimaki Discord bot for OpenCode sessions
# https://github.com/remorses/kimaki
FROM oven/bun:1-alpine
ARG VERSION=0.9.1
RUN apk add --no-cache ca-certificates curl nodejs npm

RUN npm install -g opencode-ai@latest && \
    ln -sf /usr/local/lib/node_modules/opencode-ai/node_modules/opencode-linux-arm64-musl/bin/opencode \
           /usr/local/lib/node_modules/opencode-ai/bin/.opencode
RUN npm install -g kimaki@${VERSION}

RUN adduser -D -h /home/kimaki kimaki && \
    mkdir -p /home/openchamber && \
    ln -s /home/kimaki/.kimaki /home/openchamber/.kimaki

USER kimaki
WORKDIR /home/kimaki

VOLUME ["/home/kimaki/.kimaki"]
ENTRYPOINT ["kimaki"]
