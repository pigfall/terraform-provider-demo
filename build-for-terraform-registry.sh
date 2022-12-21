#!/bin/bash

set -eux

NAME="demo-public"


# Trim the prefix 'v' of 'v1.0.0'
VERSION=${GITHUB_REF_NAME#"v"}

cp ../terraform-provider-hashicups/terraform-provider-hashicups terraform-provider-${NAME}_v${VERSION}
chmod +x terraform-provider-${NAME}_v${VERSION}

zip terraform-provider-${NAME}_${VERSION}_linux_amd64.zip terraform-provider-${NAME}_v${VERSION}

cat << EOF >> terraform-provider-${NAME}_${VERSION}_manifest.json
{
    "version": 1,
    "metadata": {
        "protocol_versions": ["6.0"]
    }
}
EOF
shasum -a 256 *.zip terraform-provider-${NAME}_${VERSION}_manifest.json > terraform-provider-${NAME}_${VERSION}_SHA256SUMS

gpg --detach-sign terraform-provider-${NAME}_${VERSION}_SHA256SUMS
