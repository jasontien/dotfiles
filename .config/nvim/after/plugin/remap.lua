vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ec", ":e $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>sc", ":luafile $MYVIMRC<CR>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format)

vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "<leader>pv", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<C-1>", ":NvimTreeToggle<CR>")

-- movement
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")

-- windows sizing
-- vim.keymap.set("n", "<Alt-Up>", ":resize -2<CR>")
-- vim.keymap.set("n", "<Alt-Down>", ":resize +2<CR>")
-- vim.keymap.set("n", "<Alt-Left>", ":vertical resize -2<CR>")
-- vim.keymap.set("n", "<Alt-Right>", ":vertical resize +2<CR>")
--
--
--
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>fd', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
