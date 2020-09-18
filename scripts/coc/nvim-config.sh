#!/usr/bin/env bash

# Setting coc configuration
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