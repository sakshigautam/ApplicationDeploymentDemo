#!/usr/bin/env bash
set -euo pipefail

# path in Vault
VAULT_PATH="secret/data/myapp"

# fetch fields using vault CLI (KV v2)
USERNAME=$(vault kv get -field=username secret/myapp)
PASSWORD=$(vault kv get -field=password secret/myapp)

# base64 encode (Kubernetes Secret data must be base64)
B64_USERNAME=$(echo -n "${USERNAME}" | base64 | tr -d '\n')
B64_PASSWORD=$(echo -n "${PASSWORD}" | base64 | tr -d '\n')

cat > secrets.yaml <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: myapp-secret
type: Opaque
data:
  username: ${B64_USERNAME}
  password: ${B64_PASSWORD}
EOF

echo "Wrote secrets.yaml (contains base64 encoded values) from Vault path ${VAULT_PATH}"
