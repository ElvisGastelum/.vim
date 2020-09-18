#!/usr/bin/env bash

# Install latest lts nodejs
if [ ! -x "$(command -v node)" ]; then
  echo 'Installing node latest lts version'
  curl --fail -LSs https://install-node.now.sh/lts | bash -s -- --yes
  export PATH="/usr/local/bin/:$PATH"
  # Or use apt-get
  # sudo apt-get install nodejs
fi