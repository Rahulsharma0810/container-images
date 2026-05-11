FROM debian:bookworm-slim

ARG TARGETARCH

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl git jq make unzip wget python3 python3-pip nodejs npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install gh CLI (latest)
RUN GH_VERSION=$(curl -fsSL https://api.github.com/repos/cli/cli/releases/latest | grep '"tag_name"' | cut -d'"' -f4 | sed 's/^v//') && \
    curl -fsSL "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_${TARGETARCH}.tar.gz" | tar -xz -C /tmp && \
    mv /tmp/gh_${GH_VERSION}_linux_${TARGETARCH}/bin/gh /usr/local/bin/gh

# Install opentofu (latest)
RUN TOFU_VERSION=$(curl -fsSL https://api.github.com/repos/opentofu/opentofu/releases/latest | grep '"tag_name"' | cut -d'"' -f4 | sed 's/^v//') && \
    curl -fsSL "https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_linux_${TARGETARCH}.tar.gz" | tar -xz -C /usr/local/bin tofu

# Install yq (latest)
RUN YQ_VERSION=$(curl -fsSL https://api.github.com/repos/mikefarah/yq/releases/latest | grep '"tag_name"' | cut -d'"' -f4 | sed 's/^v//') && \
    curl -fsSL "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_${TARGETARCH}" -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq

# Install ruff + uv (latest, musl static binaries)
RUN case "${TARGETARCH}" in \
        amd64) RUST_ARCH="x86_64-unknown-linux-musl" ;; \
        arm64) RUST_ARCH="aarch64-unknown-linux-musl" ;; \
    esac && \
    RUFF_VERSION=$(curl -fsSL https://api.github.com/repos/astral-sh/ruff/releases/latest | grep '"tag_name"' | cut -d'"' -f4 | sed 's/^v//') && \
    curl -fsSL "https://github.com/astral-sh/ruff/releases/download/${RUFF_VERSION}/ruff-${RUST_ARCH}.tar.gz" | tar -xz -C /usr/local/bin ruff && \
    UV_VERSION=$(curl -fsSL https://api.github.com/repos/astral-sh/uv/releases/latest | grep '"tag_name"' | cut -d'"' -f4 | sed 's/^v//') && \
    curl -fsSL "https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-${RUST_ARCH}.tar.gz" | tar -xz -C /tmp && \
    mv /tmp/uv-${RUST_ARCH}/uv /usr/local/bin/uv && \
    mv /tmp/uv-${RUST_ARCH}/uvx /usr/local/bin/uvx
