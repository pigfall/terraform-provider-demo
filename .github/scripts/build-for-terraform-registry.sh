#!/bin/bash

set -eux

NAME="demo-public"


# Trim the prefix 'v' of 'v1.0.0'
VERSION=${GITHUB_REF_NAME#"v"}
OS_ARCHS=('windows amd64' 'linux amd64')

cat << EOF >> terraform-provider-${NAME}_${VERSION}_manifest.json
{
    "version": 1,
    "metadata": {
        "protocol_versions": ["6.0"]
    }
}
EOF

for os_arch_str in "${OS_ARCHS[@]}";do
os_arch=($os_arch_str)
GOOS="${os_arch[0]}"
GOARCH="${od_arch[1]}"

GOOS=${GOOS} GOARCH=${GOARCH} go build -o terraform-provider-${NAME}_v${VERSION} ./cmd/terraform-provider-demo-public

zip terraform-provider-${NAME}_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-${NAME}_v${VERSION}
done



shasum -a 256 *.zip terraform-provider-${NAME}_${VERSION}_manifest.json > terraform-provider-${NAME}_${VERSION}_SHA256SUMS

gpg --detach-sign terraform-provider-${NAME}_${VERSION}_SHA256SUMS
