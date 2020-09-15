#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails
cwd=$(pwd)
# Install latest lts nodejs
if [ ! -x "$(command -v node)" ]; then
  echo 'Installing node latest lts version'
  curl --fail -LSs https://install-node.now.sh/lts | bash -s -- --yes
  export PATH="/usr/local/bin/:$PATH"
  # Or use apt-get
  # sudo apt-get install nodejs
fi

# Install yarn globally
if [ ! -x "$(command -v yarn)" ]; then
  echo 'Installing yarn package manager'
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  if [ "$(whoami)" = "root" ]; then
    apt-get update && apt-get install yarn -y
  else
    sudo apt-get update && sudo apt-get install yarn -y
  fi
fi

echo '
{
  "languageserver": {
    "go": {
      "command": "gopls",
      "rootPatterns": ["go.mod"],
      "trace.server": "verbose",
      "filetypes": ["go"]
    }
  },
  "eslint.autoFixOnSave": true,
  "eslint.filetypes": ["javascript", "javascriptreact", "typescript", "typescriptreact"],
  "prettier.disableSuccessMessage": true,
  "prettier.singleQuote": true,
  "coc.preferences.formatOnSaveFiletypes": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "css", 
    "markdown"
  ],
  "tsserver.formatOnType": true,
  "emmet.includeLanguages": {"vue-html": "html", "javascript": "javascriptreact"},
  "coc.preferences.formatOnType": true,
  "coc.preferences.extensionUpdateCheck": "never"
}
' > ~/.config/nvim/coc-settings.json 


# Install extensions
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

cd $cwd
