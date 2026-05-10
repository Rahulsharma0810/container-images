FROM ghcr.io/cukingpro/openchamber:latest

USER root

# Install gh CLI
RUN curl -fsSL https://github.com/cli/cli/releases/download/v2.63.2/gh_2.63.2_linux_amd64.tar.gz | tar -xz -C /usr/local && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
ENV PATH="/usr/local/gh_2.63.2_linux_amd64/bin:${PATH}"

COPY --chmod=755 entrypoint.sh /home/openchamber/kimaki-entrypoint.sh
RUN chown openchamber:openchamber /home/openchamber/kimaki-entrypoint.sh

USER openchamber

ENTRYPOINT ["/home/openchamber/kimaki-entrypoint.sh"]
