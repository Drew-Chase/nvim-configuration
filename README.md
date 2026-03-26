# NvChad IDE Configuration

A customized [NvChad](https://nvchad.com/) v2.5 configuration with keybindings ported from a JetBrains RustRover keymap ("Drew's Special Sauce").

## Theme

[electron-vue.nvim](https://github.com/AntonyZ89/electron-vue.nvim) (electron-vue-darker)

## Plugins

| Plugin | Purpose |
|---|---|
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi) | Multi-cursor editing (Alt+J) |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Integrated terminal |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | LSP diagnostics panel |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Git UI |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff and file history viewer |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save |

## Keybindings

All keybindings are ported from the JetBrains/IntelliJ keymap.

### Core

| Key | Action |
|---|---|
| `Ctrl+S` / `Ctrl+Shift+S` | Save all |
| `Ctrl+Z` | Undo |
| `Ctrl+Shift+Z` / `Ctrl+Y` | Redo |
| `Ctrl+C` | Copy (visual mode) |
| `Ctrl+X` | Cut (visual mode) |
| `Ctrl+V` | Paste (all modes) |
| `Ctrl+A` | Select all |
| `;` | Enter command mode |
| `jk` | Exit insert mode |

### Comments

| Key | Action |
|---|---|
| `Ctrl+Shift+C` | Toggle line comment |
| `Ctrl+Alt+C` | Toggle block comment |

### Search

| Key | Action |
|---|---|
| `Ctrl+F` | Find in file |
| `Ctrl+H` | Find and replace |
| `Ctrl+P` | Quick file open |
| `Ctrl+Shift+P` | Command palette |
| `Space+fw` | Find in files (live grep) |

### Reformat

| Key | Action |
|---|---|
| `Ctrl+Shift+F` | Reformat code |
| `Ctrl+Shift+O` | Organize imports |

### Line Operations

| Key | Action |
|---|---|
| `Ctrl+D` | Delete line |
| `Ctrl+Shift+D` | Duplicate line/selection |
| `Alt+Up/Down` | Move line up/down |

### Selection and Multi-Cursor

| Key | Action |
|---|---|
| `Ctrl+W` | Expand selection (treesitter) |
| `Ctrl+Shift+W` | Shrink selection |
| `Alt+J` | Select next occurrence |
| `Shift+Alt+J` | Skip occurrence |
| `Ctrl+Shift+Alt+J` | Select all occurrences |
| `Ctrl+Alt+Up/Down` | Add cursor above/below |

### Buffers and Windows

| Key | Action |
|---|---|
| `Ctrl+F4` | Close buffer |
| `Ctrl+Tab` / `Ctrl+Shift+Tab` | Next / previous buffer |
| `Ctrl+N` | New buffer |
| `Ctrl+B` | Toggle file explorer / go to declaration |
| `Shift+Alt+O` | Reveal file in tree |
| `Space+wh/j/k/l` | Window navigation |
| `Space+ws` / `Space+wv` | Horizontal / vertical split |
| `Space+wq` | Close window |

### Terminal

| Key | Action |
|---|---|
| `` Ctrl+` `` | Toggle terminal |
| `Shift+Alt+T` | Floating terminal |
| `Esc` | Exit terminal mode |

### LSP

| Key | Action |
|---|---|
| `Shift+Alt+R` | Rename symbol |
| `gd` | Go to definition |
| `Alt+Enter` / `Ctrl+.` | Code action / quick fix |
| `Ctrl+Space` | Trigger autocomplete |
| `Ctrl+F12` | File structure |
| `Shift+Alt+C` | Copy file reference |

### Git

| Key | Action |
|---|---|
| `Ctrl+K` | Open LazyGit (commit) |
| `Ctrl+Shift+K` | Git push |
| `Ctrl+Alt+K` | Git commit and push |
| `Ctrl+T` | Git pull |
| `Ctrl+Alt+A` | Git add current file |
| `Ctrl+Alt+Z` | Revert hunk |
| `` Ctrl+Shift+` `` | Git branches |
| `Space+gd` | Diff view |
| `Space+gh` | File git history |

### Build / Run

| Key | Action |
|---|---|
| `Ctrl+Shift+B` | Build project (auto-detects Cargo/Make/npm) |
| `Ctrl+F9` | Cargo build |
| `Ctrl+F5` | Run project |
| `F5` | Debug continue |

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
