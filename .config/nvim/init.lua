-- Centered editing
vim.opt.scrolloff = 999

-- Sync clipboard
vim.opt.clipboard:append({ "unnamedplus" })

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Appearance
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"

-- Scrolling
vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:1,hor:1"

-- Disable automatic commenting
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Keymaps
vim.keymap.set("n", "d", "\"_d", { noremap = true }) -- Remove copy on delete
vim.keymap.set("v", "d", "\"_d", { noremap = true }) -- Remove copy on delete
vim.keymap.set("x", "p", "P", { noremap = true })    -- Paste without yanking
vim.keymap.set("n", "<M-S-F>", vim.lsp.buf.format)   -- Alt+Shift+F Format

-- Plugins
vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.lsp.enable({
	"lua_ls"
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})

vim.cmd("colorscheme vague")
