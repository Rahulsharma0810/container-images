FROM ghcr.io/cukingpro/openchamber:latest

COPY --chmod=755 entrypoint.sh /home/openchamber/kimaki-entrypoint.sh
RUN chown openchamber:openchamber /home/openchamber/kimaki-entrypoint.sh

USER openchamber

ENTRYPOINT ["/home/openchamber/kimaki-entrypoint.sh"]
