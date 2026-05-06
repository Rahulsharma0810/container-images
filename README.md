# container-images

Automated container image builds for upstream projects. Images published to Docker Hub under [sharmarahul0810](https://hub.docker.com/repositories/sharmarahul0810).

## Images

### ModelRelay — `sharmarahul0810/modelrelay`

Source: [ellipticmarketing/modelrelay](https://github.com/ellipticmarketing/modelrelay)

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable release |
| `v1.16.0` | Pinned stable version |
| `beta` | Latest pre-release |
| `pr-48` | main + [PR #48](https://github.com/ellipticmarketing/modelrelay/pull/48) (multi-endpoint support) |
| `pr-50` | main + [PR #50](https://github.com/ellipticmarketing/modelrelay/pull/50) (AiHubMix provider) |
| `pr-48-50` | main + PR #48 + PR #50 combined |

```yaml
services:
  modelrelay:
    image: sharmarahul0810/modelrelay:latest
    ports: ["7352:7352"]
    volumes: [modelrelay_config:/app/config]
    environment:
      HOME: /app/config
volumes:
  modelrelay_config:
```

### MCP SuperAssistant — `sharmarahul0810/mcp-superassistant`

Source: [srbhptl39/MCP-SuperAssistant](https://github.com/srbhptl39/MCP-SuperAssistant)

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable release |
| `v0.6.0` | Pinned stable version |
| `beta` | Latest pre-release |

```yaml
services:
  mcp-sa:
    image: sharmarahul0810/mcp-superassistant:latest
    ports: ["3006:3006"]
    volumes: [./config:/app/config]
    command: ["--config", "/app/config/config.json", "--outputTransport", "sse"]
```

## Build Schedule

All workflows run **daily at 2–4am UTC** and skip builds if the version tag already exists on Docker Hub.

## Manual Builds

Trigger any workflow manually via **Actions → [workflow] → Run workflow**:

- **variants**: comma-separated list (e.g. `stable,pr-48-50`)
- **force_rebuild**: `true` to rebuild even if tag exists

## Secrets Required

Add these to the repo secrets (`Settings → Secrets → Actions`):

| Secret | Value |
|--------|-------|
| `DOCKERHUB_USERNAME` | `sharmarahul0810` |
| `DOCKERHUB_TOKEN` | Docker Hub access token (read/write) |

## Adding New PR Builds (ModelRelay)

Edit `.github/workflows/modelrelay.yml`, find the `matrix.include` block under `build-prs`, and add:

```yaml
- tag: pr-99
  prs: "99"
```

For multiple PRs combined:

```yaml
- tag: pr-48-50-99
  prs: "48 50 99"
```

PRs are applied in order via `git merge`. Conflicts fail the build with an error.
