# 🚀 imekinox's Neovim Configuration

A modern, feature-rich Neovim configuration optimized for web development, with excellent support for JavaScript/TypeScript, React, Svelte, and more. Built with Lua and powered by [Lazy.nvim](https://github.com/folke/lazy.nvim) for efficient plugin management.

## ✨ Features

### 🎨 **Modern UI & Experience**
- **PaperColor Theme** - Clean, light colorscheme optimized for readability
- **Lualine** - Beautiful statusline with git integration
- **Bufferline** - Elegant buffer tabs
- **Alpha** - Stylish dashboard/start screen
- **Which-key** - Interactive key binding help (500ms timeout)
- **Indent Blankline** - Visual indentation guides

### 🔍 **Powerful Search & Navigation**
- **Telescope** - Fuzzy finder for files, text, and more
  - Smart file ignoring (node_modules, .git, .next, .claude, build dirs)
  - Hidden file support for configs (.env, .gitignore, etc.)
  - Live grep with ripgrep integration
- **Treesitter** - Advanced syntax highlighting and text objects
- **Gitsigns** - Git integration with line indicators
- **Todo Comments** - Highlight and search TODO/FIXME/etc.

### 💻 **Development Tools**
- **LSP Integration** - Full Language Server Protocol support
  - Auto-completion with nvim-cmp
  - Go to definition, references, implementations
  - Hover documentation and diagnostics
  - Code actions and smart rename
- **Mason** - LSP server, DAP server, linter, and formatter installer
- **Lspsaga** - Enhanced LSP experience with floating windows

### 🛠 **Code Quality & Formatting**
- **Conform.nvim** - Code formatting
- **nvim-lint** - Linting integration  
- **Treesitter** - Intelligent code parsing and highlighting
- **Auto-pairs** - Automatic bracket/quote pairing
- **Auto-tag** - HTML/JSX tag auto-closing
- **Comment.nvim** - Smart commenting with treesitter context

### ⚡ **Productivity Features**
- **Auto-session** - Session management and restoration
- **Surround** - Easy text surrounding (quotes, brackets, tags)
- **Substitute** - Enhanced text substitution
- **Trouble** - Beautiful diagnostics and quickfix list
- **Tmux Navigator** - Seamless tmux pane navigation
- **Vim Maximizer** - Toggle window maximization
- **Lazygit** - Git interface integration

### 🌐 **Language Support**

Optimized parsers and LSP support for:
- **JavaScript/TypeScript** - Modern JS/TS development
- **React/JSX** - Component development with auto-tags
- **Svelte** - Full Svelte framework support  
- **HTML/CSS** - Web markup and styling
- **GraphQL** - Query language support
- **Lua** - Neovim configuration scripting
- **Python, C, Bash** - Additional language support
- **JSON, YAML** - Configuration files
- **Markdown** - Documentation
- **Prisma** - Database schema
- **Docker** - Container configuration

## 🎯 Key Bindings

### 🗂 **File Operations**
| Key | Action |
|-----|--------|
| `<Space>ff` | Find files (fuzzy search) |
| `<Space>fr` | Find recent files |
| `<Space>fs` | Find string in project (live grep) |
| `<Space>fc` | Find string under cursor |
| `<Space>ft` | Find TODO comments |

### 🧭 **Navigation**
| Key | Action |
|-----|--------|
| `<Space>w` | Save file |
| `<Space>q` | Quit |
| `<Space>nh` | Clear search highlights |
| `jk` | Exit insert mode |

### 🪟 **Window Management**
| Key | Action |
|-----|--------|
| `<Space>sv` | Split window vertically |
| `<Space>sh` | Split window horizontally |
| `<Space>se` | Make splits equal size |
| `<Space>sx` | Close current split |

### 📑 **Tab Management** 
| Key | Action |
|-----|--------|
| `<Space>to` | Open new tab |
| `<Space>tx` | Close current tab |
| `<Space>tn` | Go to next tab |
| `<Space>tp` | Go to previous tab |
| `<Space>tf` | Open current buffer in new tab |
| `<Alt-Right>` | Next tab |
| `<Alt-Left>` | Previous tab |

### 🔧 **LSP & Code**
| Key | Action |
|-----|--------|
| `gR` | Show LSP references |
| `gD` | Go to declaration |
| `gd` | Show LSP definitions (peek) |
| `gi` | Show LSP implementations |
| `gt` | Show LSP type definitions |
| `<Space>ca` | See available code actions |
| `<Space>rn` | Smart rename |
| `<Space>D` | Show buffer diagnostics |
| `<Space>d` | Show line diagnostics |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `K` | Show hover documentation |
| `<Space>rs` | Restart LSP |

### 🎯 **LSP Jump Actions**
| Key | Action |
|-----|--------|
| `<Space>jv` | Open definition in vertical split |
| `<Space>jt` | Open definition in new tab |
| `<Space>js` | Open definition in horizontal split |

### ✏️ **Editing**
| Key | Action |
|-----|--------|
| `<Ctrl-m>` | Move line down |
| `<Ctrl-M>` | Move line up |
| `<Space>+` | Increment number |
| `<Space>-` | Decrement number |

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin version lock file
├── lua/imekinox/
│   ├── lazy.lua               # Lazy.nvim setup
│   ├── core/
│   │   ├── init.lua          # Core module loader
│   │   ├── keymaps.lua       # Custom key mappings
│   │   └── options.lua       # Neovim settings
│   └── plugins/
│       ├── init.lua          # Basic plugins
│       ├── alpha.lua         # Dashboard
│       ├── autopairs.lua     # Auto bracket pairing
│       ├── auto-session.lua  # Session management
│       ├── bufferline.lua    # Buffer tabs
│       ├── colorscheme.lua   # Theme configuration
│       ├── comment.lua       # Smart commenting
│       ├── copilot.lua       # AI completion (disabled)
│       ├── dressing.lua      # UI improvements
│       ├── formatting.lua    # Code formatting
│       ├── gitsigns.lua      # Git integration
│       ├── indent-blankline.lua # Indentation guides
│       ├── lazygit.lua       # Git interface
│       ├── linting.lua       # Code linting
│       ├── lspsaga.lua       # Enhanced LSP UI
│       ├── lualine.lua       # Status line
│       ├── nvim-cmp.lua      # Autocompletion
│       ├── substitute.lua    # Text substitution
│       ├── surround.lua      # Text surrounding
│       ├── telescope.lua     # Fuzzy finder
│       ├── todo-comments.lua # TODO highlighting
│       ├── treesitter.lua    # Syntax parsing
│       ├── trouble.lua       # Diagnostics UI
│       ├── vim-maximizer.lua # Window maximization
│       ├── which-key.lua     # Key binding help
│       └── lsp/
│           ├── lspconfig.lua # LSP server configuration
│           └── mason.lua     # LSP installer
```

## 🔧 Configuration Highlights

### Smart File Filtering
The telescope configuration intelligently excludes noise while preserving access to important files:

**Excluded:**
- `node_modules/`, `.git/`, `.next/`, `.claude/`
- `dist/`, `build/`, `coverage/`, `.cache/`
- `*.lock`, `*.min.js`, `*.min.css`

**Included:**
- Hidden config files (`.env*`, `.gitignore`, `.eslintrc`, etc.)
- All source code and documentation
- Important development files

### Modern LSP Setup
- **Deprecated sign definitions fixed** - Uses modern `vim.diagnostic.config()`
- **Comprehensive language support** - Lua, TypeScript, JavaScript, Svelte, GraphQL, Emmet
- **Enhanced capabilities** - Auto-completion, hover docs, go-to-definition
- **Smart diagnostics** - Beautiful error/warning icons and floating diagnostics

### Optimized Performance
- **Lazy loading** - Plugins load only when needed
- **Event-driven** - Most plugins activate on specific events
- **Efficient search** - Ripgrep integration for fast file/text search
- **Session management** - Automatic workspace restoration

## 🚀 Getting Started

### Prerequisites
- **Neovim 0.9+**
- **Git**
- **Node.js** (for LSP servers)
- **Ripgrep** (for telescope search)
- **A Nerd Font** (for icons)

### Installation

1. **Backup your existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration:**
   ```bash
   git clone https://github.com/imekinox/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```

4. **Let Lazy.nvim install plugins:**
   - Plugins will automatically install on first launch
   - LSP servers will be installed via Mason as needed

5. **Restart Neovim** to ensure everything loads properly

### First Steps
1. Open Neovim - you'll see the Alpha dashboard
2. Try `<Space>ff` to search for files
3. Open a code file to see syntax highlighting and LSP features
4. Use `<Space>` to see available key bindings via which-key

## 🎨 Customization

### Changing the Colorscheme
Edit `lua/imekinox/plugins/colorscheme.lua`:
```lua
return {
  {
    "your-preferred-theme/theme-name",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme YourTheme]])
    end,
  },
}
```

### Adding New Languages
1. Add parsers to `lua/imekinox/plugins/treesitter.lua`
2. Install LSP servers through Mason (`:Mason`)
3. Configure servers in `lua/imekinox/plugins/lsp/lspconfig.lua`

### Custom Key Bindings
Add your mappings to `lua/imekinox/core/keymaps.lua`:
```lua
keymap.set("n", "<leader>custom", ":YourCommand<CR>", { desc = "Your custom command" })
```

## 📦 Plugin Management

### Adding Plugins
Create a new file in `lua/imekinox/plugins/` or add to existing ones:
```lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

### Updating Plugins
```bash
:Lazy update
```

### Managing LSP/Tools
```bash
:Mason
```

## 🤝 Contributing

Feel free to fork this configuration and adapt it to your needs! If you have improvements or suggestions:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This configuration is open source and available under the MIT License.

## 🙏 Acknowledgments

Built with inspiration from the Neovim community and various configuration examples. Special thanks to:
- [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding
- The entire Neovim plugin ecosystem

---

**Happy coding!** 🎉
