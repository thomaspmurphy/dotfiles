# Environment variables and PATH exports

# Editor configuration
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='hx'
fi

# PATH additions
export PATH="/Applications/Racket v8.17/bin:$PATH"
export PATH="$HOME/bin:$PATH" # Personal scripts
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# Tool-specific exports
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"

# API Keys (uncomment and set as needed)
# export ANTHROPIC_API_KEY="your-api-key-here"