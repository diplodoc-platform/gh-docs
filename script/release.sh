#!/usr/bin/env bash

set -e

VERSION=$1

export NODE_ENV=production

npm i @diplodoc/cli@latest --no-workspaces

CLI_VERSION=$(node -pe 'require("./package.json").dependencies["@diplodoc/cli"]')

if [[ -n "$(git status -s | grep package.json)" ]]; then
  git add package.json package-lock.json
  git commit -m "Update cli to version $CLI_VERSION"
  git push
fi

if [[ -n "$(git status -s)" ]]; then
  echo "Unable to release unstaged changes"
  git status -s
  exit 1
fi

git tag v$VERSION
git push origin v$VERSION
