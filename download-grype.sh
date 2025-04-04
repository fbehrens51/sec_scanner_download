#!/usr/bin/env bash

set -ex

current_dir=$(pwd)
build_dir=$(mktemp -d)


pushd $build_dir
    wget https://toolbox-data.anchore.io/grype/databases/listing.json
    gojq -r .available.[][].url listing.json| xargs -I{} wget {}
    zip -r $current_dir/grypeDB-$(date +%s).zip .
popd

rm -rf $build_dir