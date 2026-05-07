# Kimaki Discord bot for OpenCode sessions
# https://github.com/remorses/kimaki
FROM node:22-alpine
ARG VERSION=0.9.1
RUN apk add --no-cache ca-certificates curl
RUN npm install -g kimaki@${VERSION}
VOLUME ["/root/.kimaki"]
ENTRYPOINT ["kimaki"]
