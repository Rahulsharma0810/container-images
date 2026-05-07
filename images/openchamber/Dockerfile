# OpenChamber + Kimaki
# Extends cukingpro/openchamber with kimaki Discord bot
FROM ghcr.io/cukingpro/openchamber:latest

ARG KIMAKI_VERSION=0.9.1

USER root
RUN npm install -g kimaki@${KIMAKI_VERSION}

COPY --chmod=755 entrypoint.sh /home/openchamber/kimaki-entrypoint.sh
RUN chown openchamber:openchamber /home/openchamber/kimaki-entrypoint.sh

USER openchamber

ENTRYPOINT ["/home/openchamber/kimaki-entrypoint.sh"]
