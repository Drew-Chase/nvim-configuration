# NvChad IDE Configuration

A customized [NvChad](https://nvchad.com/) v2.5 configuration that replicates the feel of JetBrains IDEs and VSCode, with keybindings ported from RustRover.

## Theme

[electron-vue.nvim](https://github.com/AntonyZ89/electron-vue.nvim)

## Plugins

| Plugin | Purpose |
|---|---|
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi) | Multi-cursor editing (Ctrl+D) |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Integrated terminal |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | LSP diagnostics panel |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Git UI |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff and file history viewer |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save |

## Keybindings

### Core

| Key | Action |
|---|---|
| `Ctrl+S` | Save |
| `Ctrl+Z` | Undo |
| `Ctrl+Shift+Z` / `Ctrl+Y` | Redo |
| `Ctrl+C` | Copy (visual mode) |
| `Ctrl+X` | Cut (visual mode) |
| `Ctrl+V` | Paste (all modes) |
| `Ctrl+A` | Select all |
| `Ctrl+/` | Toggle comment |
| `;` | Enter command mode |
| `jk` | Exit insert mode |

### Search

| Key | Action |
|---|---|
| `Ctrl+F` | Find in file |
| `Ctrl+H` | Find and replace |
| `Ctrl+Shift+F` | Find in files (Telescope) |
| `Ctrl+P` | Quick file open |
| `Ctrl+Shift+P` | Command palette |

### Line Operations

| Key | Action |
|---|---|
| `Alt+Up/Down` | Move line up/down |
| `Ctrl+Shift+K` | Delete line |
| `Ctrl+Shift+D` | Duplicate line/selection |

### Multi-Cursor

| Key | Action |
|---|---|
| `Ctrl+D` | Select word / next occurrence |
| `Ctrl+Shift+Alt+J` | Select all occurrences |
| `Ctrl+Alt+Up/Down` | Add cursor above/below |

### Buffers and Windows

| Key | Action |
|---|---|
| `Ctrl+W` | Close buffer |
| `Ctrl+Tab` / `Ctrl+Shift+Tab` | Next / previous buffer |
| `Ctrl+N` | New buffer |
| `Ctrl+B` | Toggle file explorer |
| `Space+wh/j/k/l` | Window navigation |
| `Space+ws` / `Space+wv` | Horizontal / vertical split |
| `Space+wq` | Close window |

### Terminal

| Key | Action |
|---|---|
| `` Ctrl+` `` | Toggle terminal |
| `Esc` | Exit terminal mode |

### LSP

| Key | Action |
|---|---|
| `F2` | Rename symbol |
| `Shift+Alt+R` | Rename symbol (alt) |
| `gd` | Go to definition |
| `Alt+Enter` | Code action / quick fix |
| `Ctrl+.` | Code action |
| `Ctrl+Space` | Trigger autocomplete |
| `Ctrl+Shift+O` | Organize imports |
| `Ctrl+F12` | File structure |
| `Ctrl+Alt+L` | Reformat code |

### Git

| Key | Action |
|---|---|
| `Ctrl+K` | Open LazyGit |
| `Ctrl+T` | Git pull |
| `Ctrl+Alt+Z` | Revert hunk |
| `Ctrl+Alt+A` | Git add current file |
| `` Ctrl+Shift+` `` | Git branches |
| `Space+gd` | Diff view |
| `Space+gh` | File git history |

### Build / Run

| Key | Action |
|---|---|
| `Ctrl+Shift+B` | Build project (auto-detects Cargo/Make/npm) |
| `Ctrl+F5` | Run project |

### Diagnostics

| Key | Action |
|---|---|
| `Space+xx` | Toggle diagnostics panel |
| `Space+xd` | Buffer diagnostics |

## LSP Servers

Configured in `lua/configs/lspconfig.lua`:

- `rust_analyzer` (with clippy check-on-save)
- `ts_ls`
- `lua_ls`
- `html`
- `cssls`
- `jsonls`
- `yamlls`

## IDE Behaviors

- **Format on save** via conform.nvim (stylua, rustfmt, prettier)
- **Auto-save** on focus lost
- **Yank highlight** (200ms flash)
- **Cursor restore** to last edit position
- **Auto-resize** splits on terminal resize
- **Relative line numbers**
- **Smooth scrolling** with 8-line scroll offset
- **No line wrap**

## Setup

1. Clone this repo to `~/.config/nvim/`
2. Open Neovim and plugins will auto-install via lazy.nvim
3. Install LSP servers and formatters:
   ```
   :MasonInstall rust-analyzer stylua prettier
   ```
4. Install [lazygit](https://github.com/jesseduffield/lazygit) for the git UI:
   ```
   sudo pacman -S lazygit
   ```

## Based On

[NvChad/starter](https://github.com/NvChad/starter) (v2.5)
