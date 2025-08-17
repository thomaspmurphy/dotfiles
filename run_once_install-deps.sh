#!/bin/bash

# Comprehensive development environment setup script
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

install_if_missing() {
    local cmd="$1"
    local install_cmd="$2"
    local name="$3"
    
    if ! command -v "$cmd" &> /dev/null; then
        log_info "Installing $name..."
        eval "$install_cmd"
        if command -v "$cmd" &> /dev/null; then
            log_success "$name installed successfully"
        else
            log_error "Failed to install $name"
            return 1
        fi
    else
        log_info "$name already installed"
    fi
}

log_info "Starting development environment setup..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    log_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    log_success "Homebrew installed"
else
    log_info "Homebrew already installed"
fi

# Install core tools via Homebrew
log_info "Installing core tools via Homebrew..."
brew_tools=(
    "tmux"
    "bat"
    "btop"
    "exa"
    "yazi"
    "zoxide"
    "starship"
    "hugo"
    "node"
    "bun"
    "helix"
)

for tool in "${brew_tools[@]}"; do
    install_if_missing "$tool" "brew install $tool" "$tool"
done

# Install GUI applications
log_info "Installing GUI applications..."
install_if_missing "ghostty" "brew install --cask ghostty" "Ghostty terminal"

# Install Claude Code
if ! command -v claude &> /dev/null; then
    log_info "Installing Claude Code..."
    if command -v npm &> /dev/null; then
        npm install -g @anthropics/claude-code
        log_success "Claude Code installed"
    else
        log_warning "npm not found, skipping Claude Code installation"
    fi
else
    log_info "Claude Code already installed"
fi

# Install mise (if not already installed)
if ! command -v mise &> /dev/null; then
    log_info "Installing mise..."
    curl https://mise.run | sh
    export PATH="$HOME/.local/bin:$PATH"
    log_success "mise installed"
else
    log_info "mise already installed"
fi

# Install Rust (if not already installed)
if ! command -v rustc &> /dev/null; then
    log_info "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    log_success "Rust installed"
else
    log_info "Rust already installed"
fi

# Install oh-my-zsh (if not already installed)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log_info "Installing oh-my-zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    log_success "oh-my-zsh installed"
else
    log_info "oh-my-zsh already installed"
fi

# Build and install Neovim from source
if ! command -v nvim &> /dev/null || [[ "$1" == "--rebuild-nvim" ]]; then
    log_info "Building Neovim from source..."
    
    # Install build dependencies
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ninja cmake gettext curl
    else
        log_warning "Non-macOS detected. Please install ninja, cmake, gettext, and curl manually."
    fi
    
    # Clone and build Neovim
    NVIM_BUILD_DIR="/tmp/neovim-build"
    if [ -d "$NVIM_BUILD_DIR" ]; then
        rm -rf "$NVIM_BUILD_DIR"
    fi
    
    git clone https://github.com/neovim/neovim.git "$NVIM_BUILD_DIR"
    cd "$NVIM_BUILD_DIR"
    
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    
    # Clean up
    cd "$HOME"
    rm -rf "$NVIM_BUILD_DIR"
    
    log_success "Neovim built and installed from source"
else
    log_info "Neovim already installed"
fi

# Set up mise global tools
if command -v mise &> /dev/null; then
    log_info "Setting up mise global tools..."
    
    # Ensure mise is in PATH
    export PATH="$HOME/.local/bin:$PATH"
    
    # Install latest versions
    mise install elixir@latest
    mise install erlang@latest  
    mise install ruby@latest
    mise install node@latest
    
    # Set as global defaults
    mise use -g elixir@latest
    mise use -g erlang@latest
    mise use -g ruby@latest
    mise use -g node@latest
    
    log_success "mise global tools configured"
else
    log_error "mise not found, skipping tool setup"
fi

log_success "Development environment setup complete!"
log_info "Please restart your terminal or run 'source ~/.zshrc' to apply changes."