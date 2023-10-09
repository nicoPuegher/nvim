vim.g.mapleader = " " -- Set leader key to <Space>

local keymap = vim.keymap -- For conciseness

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make window splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current window split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Selection
keymap.set("n", "<leader>sa", "gg<S-v>G", { desc = "Select all" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Line manipulation
keymap.set("n", "J", "mzJ`z", { desc = "Lift line below without cursor relocation" })

-- Plus register / systerm clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })

-- Text manipulation
keymap.set(
	"n",
	"<leader>ec",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Edit current under cursor and replace all" }
)

-- File manipulation
keymap.set("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { desc = "Make file an executable" })
