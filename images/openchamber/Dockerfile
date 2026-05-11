FROM ghcr.io/rahulsharma0810/devtools:latest AS devtools

FROM ghcr.io/cukingpro/openchamber:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git nodejs npm python3 python3-pip jq make unzip wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN npm install -g bun && bunx oh-my-openagent install --no-tui --skip-auth --claude=no

COPY --from=devtools /usr/local/bin/gh /usr/local/bin/gh
COPY --from=devtools /usr/local/bin/tofu /usr/local/bin/tofu
COPY --from=devtools /usr/local/bin/yq /usr/local/bin/yq
COPY --from=devtools /usr/local/bin/ruff /usr/local/bin/ruff
COPY --from=devtools /usr/local/bin/uv /usr/local/bin/uv
COPY --from=devtools /usr/local/bin/uvx /usr/local/bin/uvx

COPY --chmod=755 entrypoint.sh /home/openchamber/kimaki-entrypoint.sh
RUN chown openchamber:openchamber /home/openchamber/kimaki-entrypoint.sh

USER openchamber

ENTRYPOINT ["/home/openchamber/kimaki-entrypoint.sh"]
