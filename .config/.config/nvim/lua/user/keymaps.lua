local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<S-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<S-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Copy entire line --
keymap("n", "Y", "yy", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Stay in indent mode
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Telescope -- live grep
-- keymap("n", "<C-p>", ":Telescope find_files <CR>", { noremap = true, silent = true })
keymap("n", "<C-p>", ":Files <CR>", { noremap = true, silent = true })
keymap("n", "<leader>g", ":Telescope live_grep <CR>", { noremap = true, silent = true })
keymap("n", "<leader>a", ":Telescope grep_string <CR>", { noremap = true, silent = true })
keymap("n", ";", ":Telescope buffers <CR>", { noremap = true, silent = true })

-- Gitsigns
keymap("n", "[c", ":Gitsigns prev_hunk <CR>", { noremap = true, silent = true })
keymap("n", "]c", ":Gitsigns next_hunk <CR>", { noremap = true, silent = true })
keymap("n", "<leader>bl", ":Gitsigns blame_line <CR>", { noremap = true, silent = true })

-- Git Blame
keymap("n", "<leader>bb", ":G blame <CR>", { noremap = true, silent = true })

-- Toggle NerdTree
keymap("n", "<C-n>", ":NERDTreeToggle <CR>", { noremap = true, silent = true })

-- Kill current buffer without closing window
-- keymap("n", "<leader>d", ":bp<bar>vsp<bar>bn<bar>bd<CR>", { noremap = true, silent = true })
keymap("n", "<leader>d", ":Bwipeout <CR>", { noremap = true, silent = true })

-- Toggle SymbolsOutline
keymap("n", "<leader>s", ":SymbolsOutline <CR>", { noremap = true, silent = true })

-- ToggleTerm (akinsho/toggleterm)
keymap("n", "<leader>t", ":ToggleTerm <CR>", { noremap = true, silent = true })
