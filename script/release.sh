#!/usr/bin/env bash

set -e

export NODE_ENV=production

npm i @diplodoc/cli@latest --no-workspaces

if [[ -z "$(git status -s | grep package.json)" ]]; then
  echo "Nothing to release"
fi

VERSION=$(node -pe 'require("./package.json").dependencies["@diplodoc/cli"].slice(1)')

git add package.json package-lock.json
git commit -m "Update cli to version $VERSION"
git push
git tag v$VERSION
git push origin v$VERSION
