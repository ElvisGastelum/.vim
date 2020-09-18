#!/usr/bin/env bash

# Installing extensions for coc
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
    echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install \
  coc-snippets coc-emmet coc-eslint \
  coc-html coc-json coc-prettier \
  coc-tslint coc-tsserver \
  --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod