#!/bin/sh
set -e

cat > /frps.toml <<EOF
bindPort = ${FRP_BIND_PORT:-7000}
auth.method = "${FRP_AUTH_METHOD:-token}"
auth.token = "${FRP_AUTH_TOKEN:-changeme}"
EOF

echo "Starting frps with config:"
cat /frps.toml

exec /usr/bin/frps -c /frps.toml
