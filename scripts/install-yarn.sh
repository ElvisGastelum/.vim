#!/usr/bin/env bash

# Install yarn globally
if [ ! -x "$(command -v yarn)" ]; then
  echo 'Installing yarn package manager'
  curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
fi