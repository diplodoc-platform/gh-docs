#!/usr/bin/env bash

set -e

export NODE_ENV=production

TAG=$1

echo "BUILD ${TAG}"

npm ci --no-workspaces
npm run build -- --no-bytecode --public-packages "*" --public --out-path dist

mv dist/gh-docs-linux-x64 dist/gh-docs_${TAG}_linux-amd64
mv dist/gh-docs-linux-arm64 dist/gh-docs_${TAG}_linux-arm64
mv dist/gh-docs-win-x64.exe dist/gh-docs_${TAG}_windows-amd64.exe
mv dist/gh-docs-win-arm64.exe dist/gh-docs_${TAG}_windows-arm64.exe
mv dist/gh-docs-macos-x64 dist/gh-docs_${TAG}_darwin-amd64
mv dist/gh-docs-macos-arm64 dist/gh-docs_${TAG}_darwin-arm64