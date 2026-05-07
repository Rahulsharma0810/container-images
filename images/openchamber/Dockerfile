# OpenChamber + Kimaki
# Extends cukingpro/openchamber with kimaki Discord bot
FROM ghcr.io/cukingpro/openchamber:latest

ARG KIMAKI_VERSION=0.9.1

USER root
RUN npm install -g kimaki@${KIMAKI_VERSION}

COPY entrypoint.sh /app/kimaki-entrypoint.sh
RUN chmod +x /app/kimaki-entrypoint.sh

USER openchamber

ENTRYPOINT ["/app/kimaki-entrypoint.sh"]
