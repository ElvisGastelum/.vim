#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails
cwd=$(pwd)
# Install latest lts nodejs
if [ ! -x "$(command -v node)" ]; then
  curl --fail -LSs https://install-node.now.sh/lts | sh
  export PATH="/usr/local/bin/:$PATH"
  # Or use apt-get
  # sudo apt-get install nodejs
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
