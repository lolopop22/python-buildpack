#!/bin/bash
set -euo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )/.."
source .envrc
echo "------> Installing Rclone via install_tools.sh"
go get github.com/rclone/rclone
go install github.com/onsi/ginkgo/ginkgo

if [ ! -f .bin/buildpack-packager ]; then
  go install github.com/cloudfoundry/libbuildpack/packager/buildpack-packager
fi
