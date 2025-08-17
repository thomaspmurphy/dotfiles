# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Codebase Overview

This is a Neovim configuration built on the LazyVim distribution. The configuration uses Lua as the primary language and follows the LazyVim plugin structure.

### Architecture

- **Entry Point**: `init.lua` - bootstraps the lazy.nvim plugin manager
- **Configuration Structure**:
  - `lua/config/` - Core LazyVim configuration files
  - `lua/plugins/` - Custom plugin specifications and configurations
- **Plugin Management**: Uses lazy.nvim for plugin management with LazyVim as the base distribution

### Key Components

- **Base Distribution**: LazyVim with extensive language support enabled (TypeScript, Rust, Ruby, Elixir, etc.)
- **Obsidian Integration**: Advanced Obsidian.nvim setup with multiple vaults (orb, avva, eniac) and custom folder pickers
- **Claude Code Integration**: claude-code.nvim plugin for AI assistance

## Development Commands

### Code Formatting
```bash
stylua . --config-path=stylua.toml
```

### Plugin Management
- Install/update plugins: Launch Neovim, plugins will auto-install via lazy.nvim
- Check plugin status: `:Lazy` in Neovim

## Configuration Conventions

### Plugin Structure
- Each plugin is defined in its own file in `lua/plugins/`
- Plugin files return a table with plugin specification following lazy.nvim format
- Custom configurations and keymaps are defined within the plugin specs

### Keybinding Patterns
- Obsidian commands use `<leader>o` prefix
- Pane navigation uses `<leader>` + arrow keys

### Code Style
- 2-space indentation (configured in stylua.toml)
- 120 character line width
- Use `local vim = vim` at the top of plugin files when accessing vim APIs extensively

## Important Files

- `lua/config/lazy.lua` - Main plugin manager configuration
- `lua/config/keymaps.lua` - Global keymaps including extensive Obsidian shortcuts
- `lua/plugins/obsidian.lua` - Complex Obsidian setup with workspace management and custom commands
- `lazyvim.json` - LazyVim extras configuration defining enabled language support and features