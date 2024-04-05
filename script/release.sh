#!/usr/bin/env bash

set -e

export NODE_ENV=production

npm i @diplodoc/cli@latest --no-workspaces

VERSION=$(node -pe 'require("./package.json").dependencies["@diplodoc/cli"]')

git commit -am "Update cli to version $VERSION"