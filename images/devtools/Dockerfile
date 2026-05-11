FROM debian:bookworm-slim

ARG TARGETARCH
ARG GH_VERSION
ARG TOFU_VERSION
ARG YQ_VERSION
ARG RUFF_VERSION
ARG UV_VERSION

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl git jq make unzip wget python3 python3-pip nodejs npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install gh CLI
RUN curl -fsSL "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_${TARGETARCH}.tar.gz" | tar -xz -C /tmp && \
    mv /tmp/gh_${GH_VERSION}_linux_${TARGETARCH}/bin/gh /usr/local/bin/gh

# Install opentofu
RUN curl -fsSL "https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_linux_${TARGETARCH}.tar.gz" | tar -xz -C /usr/local/bin tofu

# Install yq
RUN curl -fsSL "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_${TARGETARCH}" -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq

# Install ruff
RUN RUST_ARCH=$([ "${TARGETARCH}" = "arm64" ] && echo "aarch64-unknown-linux-musl" || echo "x86_64-unknown-linux-musl") && \
    curl -fsSL "https://github.com/astral-sh/ruff/releases/download/${RUFF_VERSION}/ruff-${RUST_ARCH}.tar.gz" | tar -xz -C /tmp && \
    mv /tmp/ruff-${RUST_ARCH}/ruff /usr/local/bin/ruff

# Install uv
RUN RUST_ARCH=$([ "${TARGETARCH}" = "arm64" ] && echo "aarch64-unknown-linux-musl" || echo "x86_64-unknown-linux-musl") && \
    curl -fsSL "https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-${RUST_ARCH}.tar.gz" | tar -xz -C /tmp && \
    mv /tmp/uv-${RUST_ARCH}/uv /usr/local/bin/uv && \
    mv /tmp/uv-${RUST_ARCH}/uvx /usr/local/bin/uvx
