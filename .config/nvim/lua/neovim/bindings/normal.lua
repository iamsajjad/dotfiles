
-- ... normal.lua

local U = require("neovim.core.utilities")

-- fix * (keep the cursor position, don't move to next match)
U.map("n", "*", "*N")

-- visual * and # search
-- until https://github.com/neovim/neovim/pull/15472 is merged
U.map("x", "*", 'y/\\V<C-R>"<CR>')
U.map("x", "#", 'y?\\V<C-R>"<CR>')

-- keep cursor in center
U.map("n", "n", "nzzzv", { noremap = true })
U.map("n", "N", "Nzzzv", { noremap = true })
U.map("n", "J", "mzJ`z", { noremap = true })

-- fast execute macro
U.map("x", "<S-q>", ":normal @@<CR>")
U.map("n", "<S-q>", ":normal @@<CR>")

-- quickly save the current buffer or all buffers
U.map("n", "<leader>w", ":update<CR>")
U.map("n", "<leader>W", ":wall<CR>")

-- move to the next/previous buffer
U.map("n", "<leader>[", ":bp<CR>")
U.map("n", "<leader>]", ":bn<CR>")

-- move to last buffer
U.map("n", "''", ":b#<CR>")

-- resize split files using h, j, k, l
U.map("n", "<A-k>", ":resize -1<CR>", { noremap = true })
U.map("n", "<A-j>", ":resize +1<CR>", { noremap = true })
U.map("n", "<A-h>", ":vertical resize -1<CR>", { noremap = true })
U.map("n", "<A-l>", ":vertical resize +1<CR>", { noremap = true })

-- reset splits size
U.map("n", "<A-e>", ":wincmd =<CR>", { noremap = true })

-- maximize current split
U.map("n", "<A-m>", "<C-w><bar> <C-w>_", { noremap = true })

-- tabs mapping
U.map("n", "th", ":tabfirst<CR>", { noremap = true })
U.map("n", "tk", ":tabnext<CR>", { noremap = true })
U.map("n", "tj", ":tabprev<CR>", { noremap = true })
U.map("n", "tl", ":tablast<CR>", { noremap = true })
U.map("n", "tt", ":tabedit<Space>", { noremap = true, silent = false })
U.map("n", "tn", ":tabnext<Space>", { noremap = true })
U.map("n", "tm", ":tabm<Space>", { noremap = true })
U.map("n", "td", ":tabclose<CR>", { noremap = true })

-- fold mapping
U.map("n", "<leader>ff", ":set foldmethod=manual<CR>", { noremap = true })
U.map("n", "<leader>fi", ":set foldmethod=indent<CR>", { noremap = true })
U.map("n", "<leader>fm", ":set foldmethod=marker<CR>", { noremap = true })
U.map("n", "<leader>fs", ":set foldmethod=syntax<CR>", { noremap = true })
U.map("n", "<leader>fd", ":set foldmethod=diff<CR>", { noremap = true })

-- drop a mark before jumping to the top or bottom of the file
U.map("n", "gg", "mjgg", { noremap = true })
U.map("n", "G", "mjG", { noremap = true })

-- use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
U.map("o", "A", ":<C-U>normal! mzggVG<CR>`z")
U.map("x", "A", ":<C-U>normal! ggVG<CR>")

-- replace the word under cursor
U.map("n", "<leader>r", ":%s/<C-R><C-W>//gI<left><left><left>", { noremap = true, silent = false })

-- taggle between split files
U.map("n", "<tab>", "<C-w>w", { noremap = true })

-- move line up and down
U.map("n", "<leader>k", ":move .-2<CR>==", { noremap = true })
U.map("n", "<leader>j", ":move .+1<CR>==", { noremap = true })

-- open .notes file
U.map("n", "<leader>t", ":tabedit ~/.notes<CR>", { noremap = true })

-- duplicate current line >>> 'yy' >>> 'p'
U.map("n", "<A-p>", "mzyyp`z", { noremap = false })

-- map key to dismiss search highlighted ness
U.map("n", "<BS>", ":nohlsearch<CR>", { noremap = true })

