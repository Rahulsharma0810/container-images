FROM docker.io/samanhappy/mcphub:latest

RUN apt-get update && apt-get install -y --no-install-recommends curl tar && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then JIRA_ARCH="arm64"; else JIRA_ARCH="x86_64"; fi && \
    JIRA_VERSION=$(curl -s https://api.github.com/repos/ankitpokhrel/jira-cli/releases/latest \
      | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/') && \
    curl -L "https://github.com/ankitpokhrel/jira-cli/releases/download/v${JIRA_VERSION}/jira_${JIRA_VERSION}_linux_${JIRA_ARCH}.tar.gz" \
      | tar -xz -C /tmp && \
    mv /tmp/jira_${JIRA_VERSION}_linux_${JIRA_ARCH}/bin/jira /usr/local/bin/jira && \
    chmod +x /usr/local/bin/jira && \
    rm -rf /tmp/jira_* && \
    apt-get remove -y curl tar && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
