#!/bin/sh

set -x

# Begin build process

rm -rf build/
mkdir build/

cp -R src/ build/
[ -d "build/css" ] && mkdir -p build/css || true

ls

[ -d "src/less" ] && for f in src/less/*.less; do lessc $f > build/css/$(basename $f .less).css; done || true

ls build

python build/render_templates.py

# End build process
