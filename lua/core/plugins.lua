local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Менеджер LSP-серверов (только установка, без автоматической настройки)
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    -- LSP клиент
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim" },
    },

    -- Автодополнение
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
    },

    -- Подсветка синтаксиса
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "python", "cpp", "c" },
                auto_install = true,
                highlight = { enable = true },
            })
        end,
    },

    -- Иконки (для neo-tree и терминала)
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    -- Neo-tree (файловый менеджер)
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                popup_border_style = "rounded",
                enable_git_status = false,
                window = {
                    width = 30,
                    position = "left",
                },
                filesystem = {
                    filtered_items = {
                        visible = false,
                        hide_dotfiles = false,
                        hide_gitignored = true,
                    },
                },
            })
        end,
    },

    -- ========== НОВЫЕ ПЛАГИНЫ ==========
    -- Внутренний терминал
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 10,              -- высота в строках (для горизонтального)
                open_mapping = [[<c-\>]], -- можно переопределить, но мы зададим свою клавишу
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "float",    -- плавающее окно (можно "horizontal", "vertical")
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })
        end,
    },

    -- Автозакрытие скобок и кавычек
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true, -- использовать treesitter для улучшения
                ts_config = {
                    lua = { "string" }, -- не ставить пары внутри строк
                    javascript = { "template_string" },
                    java = false,
                },
                disable_filetype = { "TelescopePrompt", "spectre_panel" },
                fast_wrap = {
                    map = "<M-e>",
                    chars = { "{", "[", "(", '"', "'" },
                    pattern = [=[[%'%"%>%]%)%}%,]]=],
                    end_key = "$",
                    keys = "qwertyuiopasdfghjklzxcvbnm",
                    check_comma = true,
                    highlight = "Search",
                    highlight_grey = "Comment",
                },
            })
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- опционально
    },
})
