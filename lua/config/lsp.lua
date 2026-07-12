local lspconfig = require("lspconfig")

-- Настройка диагностики
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
})

-- Горячие клавиши LSP
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr })
    end,
})

-- Настройка pyright
lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
            },
        },
    },
})

-- Настройка clangd
lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index" },
})

-- ===== ВАЖНО: больше нет автоматической установки =====
-- Установите pyright и clangd вручную через :Mason
-- Откройте :Mason, найдите pyright и clangd, нажмите Install.
-- Это делается один раз.
