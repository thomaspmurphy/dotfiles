# Tool initializations and completions

# Mise (for managing runtime versions)
if command -v mise &> /dev/null; then
    eval "$(mise activate zsh)"
fi

# Starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Zoxide (better cd)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# OCaml and OPAM
[[ ! -r '/Users/thomas/.opam/opam-init/init.zsh' ]] || source '/Users/thomas/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

# qlty completions
[ -s "/opt/homebrew/share/zsh/site-functions/_qlty" ] && source "/opt/homebrew/share/zsh/site-functions/_qlty"

# bun completions
[ -s "/Users/thomas/.bun/_bun" ] && source "/Users/thomas/.bun/_bun"

# Auto-start tmux if not already in a session
if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then 
    exec tmux
fi