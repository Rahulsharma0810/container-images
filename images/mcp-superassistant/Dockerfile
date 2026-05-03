# MCP SuperAssistant proxy server
# Installs the published npm package at a pinned version
FROM node:22-alpine
ARG VERSION=latest
RUN apk add --no-cache ca-certificates
RUN npm install -g @srbhptl39/mcp-superassistant-proxy@${VERSION}
WORKDIR /app
VOLUME ["/app/config"]
EXPOSE 3006
ENTRYPOINT ["mcp-superassistant-proxy"]
CMD ["--outputTransport", "sse", "--port", "3006"]
