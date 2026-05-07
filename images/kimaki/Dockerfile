# Kimaki Discord bot for OpenCode sessions
# https://github.com/remorses/kimaki
FROM oven/bun:1-alpine
ARG VERSION=0.9.1
RUN apk add --no-cache ca-certificates curl nodejs npm
RUN npm install -g opencode-ai@latest
RUN npm install -g kimaki@${VERSION}
VOLUME ["/root/.kimaki"]
ENTRYPOINT ["kimaki"]
