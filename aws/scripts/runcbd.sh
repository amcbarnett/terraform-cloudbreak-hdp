#!/bin/bash

# sleep until instance is ready

cat > Profile << EOF
export UAA_DEFAULT_SECRET=$1
export UAA_DEFAULT_USER_PW=$2
export UAA_DEFAULT_USER_EMAIL=$3
EOF

cbd start

#curl -Ls https://s3-us-west-2.amazonaws.com/cb-cli/cb-cli_2.5.0_Linux_x86_64.tgz | sudo tar -xz -C /bin cb