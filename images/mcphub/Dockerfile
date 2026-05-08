# latest tag — upstream image + jira additions
FROM docker.io/samanhappy/mcphub:latest

ARG JIRA_CLI_VERSION=1.7.0

RUN apt-get update && apt-get install -y --no-install-recommends curl && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then JIRA_ARCH="arm64"; else JIRA_ARCH="x86_64"; fi && \
    curl -fsSL "https://github.com/ankitpokhrel/jira-cli/releases/download/v${JIRA_CLI_VERSION}/jira_${JIRA_CLI_VERSION}_linux_${JIRA_ARCH}.tar.gz" \
      | tar -xz -C /tmp && \
    find /tmp -name 'jira' -type f | head -1 | xargs -I{} mv {} /usr/local/bin/jira && \
    chmod +x /usr/local/bin/jira && \
    npm install -g @choplin/jira-cli-mcp && \
    rm -rf /tmp/jira_* /var/lib/apt/lists/*
