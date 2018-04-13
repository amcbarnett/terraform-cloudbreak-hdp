#!/bin/bash

# sleep until instance is ready

cat > Profile << EOF
export UAA_DEFAULT_SECRET=$1
export UAA_DEFAULT_USER_PW=$2
export UAA_DEFAULT_USER_EMAIL=$3
EOF
