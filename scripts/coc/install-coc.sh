#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails
cwd=$(pwd)

# Install dependencies
echo Install dependencies
. ~/.vim/scripts/coc/dependencies.sh

# Configurate coc
echo Configurate coc
. ~/.vim/scripts/coc/nvim-config.sh

# Install extensions
echo Install extensions
. ~/.vim/scripts/coc/extensions.sh

cd $cwd
