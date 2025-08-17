# Thomas's Dotfiles

A comprehensive development environment setup using [chezmoi](https://chezmoi.io) for macOS.

## Quick Setup (New Machine)

### One Command Setup
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply thomaspmurphy/dotfiles
```

This will:
1. Install chezmoi
2. Clone this dotfiles repository 
3. Apply all configurations
4. Run the installation script for all dependencies

### Manual Setup
```bash
# Install chezmoi
brew install chezmoi

# Initialize with this repository
chezmoi init thomaspmurphy/dotfiles

# Apply the dotfiles
chezmoi apply

# Run the installation script manually if needed
~/.local/share/chezmoi/run_once_install-deps.sh
```

## What's Included

### Core Configuration Files
- **`.zshrc`** - Minimal zsh configuration that loads Oh My Zsh
- **`.tmux.conf`** - Tmux configuration for terminal multiplexing
- **`.config/nvim/`** - Complete Neovim setup with LazyVim
- **`.config/helix/`** - Helix editor configuration
- **`.config/mise/`** - Runtime version manager configuration
- **`.doom.d/`** - Doom Emacs configuration

### Oh My Zsh Custom Files
Located in `~/.oh-my-zsh/custom/`:
- **`aliases.zsh`** - Personal command aliases
- **`exports.zsh`** - Environment variables and PATH configuration
- **`tools.zsh`** - Tool initializations and completions

### Installation Scripts
- **`run_once_install-deps.sh`** - Comprehensive dependency installation script

## Installed Tools & Applications

### Essential System Tools
- **Xcode Command Line Tools** - Required for compilation on macOS
- **Homebrew** - Package manager for macOS
- **Git** - Version control (comes with Xcode CLI tools)

### Development Tools
- **Neovim** - Built from source with LazyVim configuration
- **Helix** - Modern text editor
- **Emacs** - Text editor with Doom Emacs configuration
- **tmux** - Terminal multiplexer
- **Claude Code** - AI-powered CLI tool

### Language Runtimes (via mise)
- **Node.js** - JavaScript runtime (latest)
- **Bun** - Fast JavaScript runtime and package manager
- **Ruby** - Programming language (latest)
- **Elixir** - Functional programming language (latest)
- **Erlang** - Erlang/OTP platform (latest)
- **Rust** - Systems programming language
- **Racket** - Functional programming language for PLT research

### C Development Tools
- **GCC** - GNU Compiler Collection
- **Clang** - LLVM C compiler (comes with Xcode)
- **CMake** - Build system generator
- **Make** - Build automation tool
- **pkg-config** - Helper tool for compiling
- **autoconf** - Configuration script generator
- **automake** - Makefile generator
- **libtool** - Generic library support script

### CLI Utilities
- **bat** - Better `cat` with syntax highlighting
- **btop** - Resource monitor (better `top`)
- **exa** - Modern `ls` replacement
- **yazi** - Terminal file manager
- **zoxide** - Smart `cd` command
- **starship** - Cross-shell prompt
- **hugo** - Static site generator
- **exercism** - Code practice and mentorship platform CLI
- **rg (ripgrep)** - Fast text search
- **fd** - Fast file finder
- **fzf** - Fuzzy finder for command line

### GUI Applications
- **Ghostty** - Fast, feature-rich terminal emulator
- **Obsidian** - Knowledge management and note-taking

### Shell & Terminal
- **Zsh** - Default shell
- **Oh My Zsh** - Zsh framework with plugins
- **Starship** - Cross-shell prompt

## Directory Structure

```
~/.local/share/chezmoi/
├── README.md                           # This file
├── dot_zshrc                          # → ~/.zshrc
├── dot_tmux.conf                      # → ~/.tmux.conf
├── dot_config/
│   ├── nvim/                          # → ~/.config/nvim/
│   ├── helix/                         # → ~/.config/helix/
│   └── mise/
│       └── config.toml                # → ~/.config/mise/config.toml
├── dot_doom.d/                        # → ~/.doom.d/
│   ├── config.el                      # Doom Emacs configuration
│   ├── init.el                        # Doom Emacs modules
│   └── packages.el                    # Doom Emacs packages
├── dot_oh-my-zsh/
│   └── custom/
│       ├── aliases.zsh                # → ~/.oh-my-zsh/custom/aliases.zsh
│       ├── exports.zsh                # → ~/.oh-my-zsh/custom/exports.zsh
│       └── tools.zsh                  # → ~/.oh-my-zsh/custom/tools.zsh
└── run_once_install-deps.sh           # Installation script
```

## Key Features

### Organized Zsh Configuration
Instead of a monolithic `.zshrc`, configurations are organized into logical files:
- Core Oh My Zsh setup in `.zshrc`
- Aliases in `aliases.zsh`
- Environment variables in `exports.zsh`
- Tool initializations in `tools.zsh`

### Automatic Dependency Management
- **mise** manages language runtimes automatically
- Installation script handles all system dependencies
- Checks for existing installations to avoid conflicts

### Security Considerations
- API keys are commented out in templates (set manually)
- Sensitive information is not tracked in git

## Customization

### Adding New Tools
1. Add to the `brew_tools` array in `run_once_install-deps.sh`
2. Add any configuration files to the appropriate directory
3. Update aliases or exports as needed

### Modifying Aliases
Edit `~/.oh-my-zsh/custom/aliases.zsh` and run `source ~/.zshrc`

### Runtime Versions
Modify `~/.config/mise/config.toml` or use mise commands:
```bash
mise install node@18.0.0
mise use -g node@18.0.0
```

## Troubleshooting

### Rebuilding Neovim
If you need to rebuild Neovim from source:
```bash
~/.local/share/chezmoi/run_once_install-deps.sh --rebuild-nvim
```

### Reinstalling Doom Emacs
If you need to reinstall Doom Emacs:
```bash
~/.local/share/chezmoi/run_once_install-deps.sh --reinstall-doom
```

### Using Doom Emacs
After installation, you can use these commands:
```bash
doom sync      # Sync configuration changes
doom upgrade   # Update Doom and packages
doom doctor    # Check for issues
```

### Using Exercism
After installation, configure exercism for code practice:
```bash
exercism configure --token=your_exercism_token
exercism download --exercise=hello-world --track=elixir
exercism submit path/to/solution.ex
```

### Missing Tools
Re-run the installation script:
```bash
~/.local/share/chezmoi/run_once_install-deps.sh
```

### Xcode Command Line Tools Issues
If compilation fails, reinstall Xcode CLI tools:
```bash
xcode-select --install
```

### Oh My Zsh Plugin Issues
If zsh plugins aren't working, check that they're properly listed in `.zshrc`:
```bash
plugins=(git zoxide mise)
```

## Manual Steps After Setup

1. **Set API Keys**: Uncomment and set your API keys in `~/.oh-my-zsh/custom/exports.zsh`
2. **Configure Git**: Set your git user name and email
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```
3. **Terminal Theme**: Configure Ghostty or your terminal colors as preferred

## Updating

To update your dotfiles:
```bash
chezmoi update
```

To sync local changes back to the repository:
```bash
chezmoi cd
git add .
git commit -m "Update configurations"
git push
```

## Dependencies

This setup requires:
- macOS (10.15+)
- Internet connection for downloads
- Admin privileges for some installations

All other dependencies are automatically installed by the setup script.