if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source /Users/rubertmartinpardo/.config/broot/launcher/bash/br
. "$HOME/.cargo/env"
export PATH="/usr/local/opt/unixodbc/bin:$PATH"
export PATH="/usr/local/opt/unixodbc/bin:$PATH"
