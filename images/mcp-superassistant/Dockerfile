# MCP SuperAssistant proxy server
# Installs the published npm package at a pinned version
FROM node:22-alpine
ARG VERSION=0.1.7
RUN apk add --no-cache ca-certificates curl
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"
RUN npm install -g @srbhptl39/mcp-superassistant-proxy@0.1.7
WORKDIR /app
VOLUME ["/app/config"]
EXPOSE 3006
ENTRYPOINT ["mcp-superassistant-proxy"]
CMD ["--outputTransport", "sse", "--port", "3006"]
