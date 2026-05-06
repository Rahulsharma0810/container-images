# OpenWork — Den platform (API + Web)
FROM node:22-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable && corepack prepare pnpm@10 --activate
RUN apk add --no-cache ca-certificates python3 make g++

# ---- deps ----
FROM base AS deps
WORKDIR /app
# Copy workspace configuration
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml turbo.json ./
# Copy all package manifests first to optimize caching (optional but recommended)
# For now, we copy the directories to ensure all workspace members are found
COPY packages/ packages/
COPY ee/ ee/
COPY apps/ apps/
COPY patches/ patches/
RUN pnpm install --frozen-lockfile

# ---- build ----
FROM deps AS builder
COPY . .
# Disable telemetry/analytics at build time
ENV NEXT_TELEMETRY_DISABLED=1
ENV NEXT_PUBLIC_POSTHOG_KEY=""
ENV NEXT_PUBLIC_POSTHOG_API_KEY=""
RUN pnpm turbo build --filter="@openwork-ee/den-api..." --filter="@openwork-ee/den-web..."

# ---- runner ----
FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1

# We need the full source for pnpm start to work in monorepo, 
# but we can prune node_modules and re-install production deps.
COPY --from=builder /app ./

# Clean up dev dependencies and build cache to keep image size reasonable
RUN rm -rf .turbo && \
    find . -name "node_modules" -maxdepth 4 -type d -exec rm -rf {} + && \
    CI=true pnpm install --prod --frozen-lockfile --ignore-scripts

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# den-api: 8790, den-web: 3005
EXPOSE 8790 3005

ENTRYPOINT ["/entrypoint.sh"]
