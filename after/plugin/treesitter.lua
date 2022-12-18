require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "help", 
    "javascript", 
    "dockerfile", 
    "typescript", 
    "html",
    "json",
    "markdown",
    "python",
    "scss",
    "sql",
    "vim",
    "c", 
    "lua", 
    "css",
    "rust",
  },

  sync_install = false,

  auto_install = true,

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",

        ["ip"] = "@parameter.inner",
        ["ap"] = "@parameter.outer",

        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      },
      include_surrounding_whitespace = false
    },
    swap = {
      enable = true,
      swap_next = {
        ["<C-m>"] = "@parameter.inner"
      },
      swap_previous = {
        ["<C-n>"] = "@parameter.inner"
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_previous_start = {
        ["<C-a>"] = "@parameter.inner"
      },
      goto_next_start = {
        ["<C-s>"] = "@parameter.inner"
      }
    }
  },
  ident = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
