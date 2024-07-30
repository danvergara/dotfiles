require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- tmux navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- gopher.nvim

-- Add struct tags
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })
map("n", "<leader>gsd", "<cmd> GoTagAdd db <CR>", { desc = "Add db struct tags" })

-- Remove struct tags
map("n", "<leader>rsj", "<cmd> GoTagRm json <CR>", { desc = "Remove json struct tags" })
map("n", "<leader>rsy", "<cmd> GoTagRm yaml <CR>", { desc = "Remove yaml struct tags" })
map("n", "<leader>rsd", "<cmd> GoTagRm db <CR>", { desc = "Remove db struct tags" })

-- Generate if err != nil { via iferr
map("n", "<leader>er", "<cmd> GoIfErr <CR>", { desc = "Gemerate error if err != nil {" })

-- Run Go mod tidy
map("n", "<leader>mt", "<cmd> GoMod tidy <CR>", { desc = "Run Go mod tidy" })

-- Vim Fugitive
map("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
map("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
map("n", "<leader>gl", "<cmd>Git log<CR>", { desc = "Git log" })
map("n", "<leader>gst", "<cmd>Git status<CR>", { desc = "Git status:" })
map("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })

-- undotree
map("n", "<leader>ut", "<cmd> UndotreeToggle <CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
