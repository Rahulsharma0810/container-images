# OpenWork — Den platform (API + Web)
# Adjust TURBO_FILTER if workspace paths differ
FROM node:22-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable && corepack prepare pnpm@10 --activate
RUN apk add --no-cache ca-certificates python3 make g++

# ---- deps ----
FROM base AS deps
WORKDIR /app
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml turbo.json ./
# Copy workspace package manifests only (cache layer)
COPY packages/ packages/
COPY ee/ ee/
COPY patches/ patches/
RUN find packages ee -mindepth 2 -name "package.json" | head -50
RUN pnpm install --frozen-lockfile

# ---- build ----
FROM deps AS builder
ARG TURBO_FILTER="@openwork-ee/den-api"
COPY . .
RUN pnpm turbo build --filter="${TURBO_FILTER}..."

# ---- runner ----
FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production
# Copy the full monorepo with built artifacts
# Adjust the path below to match the actual den-api output dir
COPY --from=builder /app ./
RUN pnpm install --prod --frozen-lockfile --ignore-scripts

# API port — adjust if needed
EXPOSE 8790
# Adjust entrypoint to match den-api start script
CMD ["pnpm", "--filter", "@openwork-ee/den-api", "start"]
