set shell := ["bash", "-cu"]
set windows-shell := ["pwsh", "-Command"]

oxfmt := "pnpm exec oxfmt"

# Default action
_:
    just --list -u

# Install
i:
    pnpm install --no-frozen-lockfile

# Install with frozen lockfile
if:
    pnpm install --frozen-lockfile

# Format code
fmt:
    {{oxfmt}}

# Check code
check: fmt

# Clean everything (Linux)
clean-all-linux:
    rm -rf ./node_modules

# Clean everything (macOS)
clean-all-macos:
    just clean-all-linux

# Clean everything (Windows)
clean-all-windows:
    if (Test-Path "./node_modules") { Remove-Item -Recurse -Force "./node_modules" }

# Clean everything
clean-all:
    just clean-all-{{os()}}
