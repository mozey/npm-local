#!/usr/bin/env bash
set -eu                   # exit on error or undefined variable
bash -c 'set -o pipefail' # return code of first cmd to fail in a pipeline

if [[ ${1:-} = "help" ]]
then
  echo ""
  echo "USAGE:"
  echo "  $(basename "$0")"
  echo ""
  exit 0
fi

APP_DIR="$PRO_PATH/npm-local"

echo "Building app..."

# Static analysis of TypeScript source with tsc, don't bundle
tsc -noEmit --project "$APP_DIR"

# Create type definitions
# https://www.typescriptlang.org/docs/handbook/declaration-files/dts-from-js.html
tsc src/* --declaration --emitDeclarationOnly --outFile dist/npm-local.d.ts

# Bundle app Javascript and CSS with esbuild.
# Sourcemap enables viewing and debugging TypeScript source in Dev Console
# https://esbuild.github.io/api/#sourcemap
esbuild "${APP_DIR}"/src/greeter.ts --sourcemap --bundle \
    --outfile="$APP_DIR/dist/greeter.js" \
    --minify

echo "Done $(basename "$0")"
echo ""
