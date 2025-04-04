#!/usr/bin/env bash

set -ex

# Databases are published to GHCR
# ghcr.io/aquasecurity/trivy-db 	    https://ghcr.io/aquasecurity/trivy-db
# ghcr.io/aquasecurity/trivy-java-db 	https://ghcr.io/aquasecurity/trivy-java-db
# ghcr.io/aquasecurity/trivy-checks 	https://ghcr.io/aquasecurity/trivy-checks

set -ex

current_dir=$(pwd)
build_dir=$(mktemp -d)

pushd $build_dir
    # VEX needs to be pulled in
    wget https://github.com/aquasecurity/vexhub/archive/refs/heads/main.zip
    wget https://github.com/aquasecurity/vexhub/blob/main/vex-repository.json
    zip -r $current_dir/Vexhub-$(date +%s).zip .
popd

rm -rf $build_dir



