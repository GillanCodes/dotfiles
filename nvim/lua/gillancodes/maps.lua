---@diagnostic disable: undefined-global, redundant-parameter
-- ~/nvim/lua/gillancodes/maps.lua

vim.g.mapleader = " "

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "f", "<cmd>Telescope find_files<cr>")
map("n", "<leader>ff", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- map("n", "=", "<cmd>vertical resize +5<cr>")
-- map("n", ")", "<cmd>vertical resize -5<cr>")
-- map("n", "$", "<cmd>horizontal resize +5<cr>")
-- map("n", "^", "<cmd>horizontal resize -5<cr>")

-- Buffers
map("n", "<leader>bd", "<CMD>bd!<CR>")
map("n", "<leader>bn", "<CMD>enew<CR>")
map("n", "<leader>bq", "<CMD>write|bdelete<CR>")
map("n", "<Tab>", "<CMD>bnext<CR>")
map("n", "<S-Tab>", "<CMD>bnext<CR>")

-- Split
map("n", "<leader>sv", "<CMD>vnew<CR>")
map("n", "<leader>sh", "<CMD>new<CR>")

-- Explorer (MOved to Yazi)
map("n", "<leader>e", "<CMD>Explore<CR>")

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- New Windows
map("n", "<leader>j", "<CMD>vsplit<CR>")
map("n", "<leader>k", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move cursor while in insert mode
map({ "n", "v", "i" }, "<C-a>", "<ESC>^i", { desc = "move beginning of line" })
map({ "n", "v", "i" }, "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Show diagnostic in a floating window
vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Nonels
map({ "n", "v" }, "<leader>fm", vim.lsp.buf.format, {})

-- FTerm
vim.keymap.set("n", "<C-return>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("n", "<C-backspace>", '<CMD>lua require("FTerm").exit()<CR>')
vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Search
vim.keymap.set("n", "sc", ":nohlsearch<CR>", { desc = "Clear Search" })

-- Go to definitions
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
