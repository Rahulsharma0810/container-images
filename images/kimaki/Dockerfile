# Kimaki Discord bot for OpenCode sessions
# https://github.com/remorses/kimaki
FROM ghcr.io/rahulsharma0810/devtools:latest AS devtools

FROM oven/bun:1-alpine
ARG VERSION=0.9.1

RUN apk add --no-cache ca-certificates git nodejs npm python3 py3-pip jq make unzip wget

COPY --from=devtools /usr/local/bin/gh /usr/local/bin/gh
COPY --from=devtools /usr/local/bin/tofu /usr/local/bin/tofu
COPY --from=devtools /usr/local/bin/yq /usr/local/bin/yq
COPY --from=devtools /usr/local/bin/ruff /usr/local/bin/ruff
COPY --from=devtools /usr/local/bin/uv /usr/local/bin/uv
COPY --from=devtools /usr/local/bin/uvx /usr/local/bin/uvx

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
