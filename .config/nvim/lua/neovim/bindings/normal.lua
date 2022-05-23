
-- ... normal.lua

local Mapper = require("neovim.core.mapper")

-- fix * (keep the cursor position, don't move to next match)
Mapper.map("n", "*", "*N")

-- visual * and # search
-- until https://github.com/neovim/neovim/pull/15472 is merged
Mapper.map("x", "*", 'y/\\V<C-R>"<CR>')
Mapper.map("x", "#", 'y?\\V<C-R>"<CR>')

-- keep cursor in center
Mapper.map("n", "n", "nzzzv", { noremap = true })
Mapper.map("n", "N", "Nzzzv", { noremap = true })
Mapper.map("n", "J", "mzJ`z", { noremap = true })

-- fast execute macro
Mapper.map("x", "<S-q>", ":normal @@<CR>")
Mapper.map("n", "<S-q>", ":normal @@<CR>")

-- quickly save the current buffer or all buffers
Mapper.map("n", "<leader>w", ":update<CR>")
Mapper.map("n", "<leader>W", ":wall<CR>")

-- move to the next/previous buffer
Mapper.map("n", "<leader>[", ":bp<CR>")
Mapper.map("n", "<leader>]", ":bn<CR>")

-- move to last buffer
Mapper.map("n", "''", ":b#<CR>")

-- resize split files using h, j, k, l
Mapper.map("n", "<A-k>", ":resize -1<CR>", { noremap = true })
Mapper.map("n", "<A-j>", ":resize +1<CR>", { noremap = true })
Mapper.map("n", "<A-h>", ":vertical resize -1<CR>", { noremap = true })
Mapper.map("n", "<A-l>", ":vertical resize +1<CR>", { noremap = true })

-- reset splits size
Mapper.map("n", "<A-e>", ":wincmd =<CR>", { noremap = true })

-- maximize current split
Mapper.map("n", "<A-m>", "<C-w><bar> <C-w>_", { noremap = true })

-- tabs mapping
Mapper.map("n", "th", ":tabfirst<CR>", { noremap = true })
Mapper.map("n", "tk", ":tabnext<CR>", { noremap = true })
Mapper.map("n", "tj", ":tabprev<CR>", { noremap = true })
Mapper.map("n", "tl", ":tablast<CR>", { noremap = true })
Mapper.map("n", "tt", ":tabedit<Space>", { noremap = true, silent = false })
Mapper.map("n", "tn", ":tabnext<Space>", { noremap = true, silent = false })
Mapper.map("n", "tm", ":tabmove<Space>", { noremap = true, silent = false })
Mapper.map("n", "td", ":tabclose<CR>", { noremap = true })

-- fold mapping
Mapper.map("n", "<leader>ff", ":set foldmethod=manual<CR>", { noremap = true })
Mapper.map("n", "<leader>fi", ":set foldmethod=indent<CR>", { noremap = true })
Mapper.map("n", "<leader>fm", ":set foldmethod=marker<CR>", { noremap = true })
Mapper.map("n", "<leader>fs", ":set foldmethod=syntax<CR>", { noremap = true })
Mapper.map("n", "<leader>fd", ":set foldmethod=diff<CR>", { noremap = true })

-- drop a mark before jumping to the top or bottom of the file
Mapper.map("n", "gg", "mjgg", { noremap = true })
Mapper.map("n", "G", "mjG", { noremap = true })

-- use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
Mapper.map("o", "A", ":<C-U>normal! mzggVG<CR>`z")
Mapper.map("x", "A", ":<C-U>normal! ggVG<CR>")

-- replace the word under cursor
Mapper.map("n", "<leader>r", ":%s/<C-R><C-W>//gI<left><left><left>", { noremap = true, silent = false })

-- taggle between split files
Mapper.map("n", "<tab>", "<C-w>w", { noremap = true })

-- move line up and down
Mapper.map("n", "<leader>k", ":move .-2<CR>==", { noremap = true })
Mapper.map("n", "<leader>j", ":move .+1<CR>==", { noremap = true })

-- open .notes file
Mapper.map("n", "<leader>t", ":tabedit ~/.notes<CR>", { noremap = true })

-- duplicate current line >>> 'yy' >>> 'p'
Mapper.map("n", "<A-p>", "mzyyp`z", { noremap = false })

-- map key to dismiss search highlighted ness
Mapper.map("n", "<BS>", ":nohlsearch<CR>", { noremap = true })

