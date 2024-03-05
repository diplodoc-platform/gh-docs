#!/usr/bin/env bash

#- run 'cd gh-docs; gh extension install .' to install your extension locally
#- fill in script/build.sh with your compilation script for automated builds
#- compile a gh-docs binary locally and run 'gh docs' to see changes
#- run 'gh repo create' to share your extension with others

set -e

export NODE_ENV=production

npm ci

if [ "$1" == 'version' ]; then
    npm i --registry='https://registry.npmjs.org/' @diplodoc/cli@$2
else
    npm i --registry='https://registry.npmjs.org/' @diplodoc/cli@latest
fi

npm run build
