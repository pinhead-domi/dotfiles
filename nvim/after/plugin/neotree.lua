vim.keymap.set('n', '<leader>f', '<cmd>Neotree position=right toggle=true<CR>', { desc = 'show [f]iles' })

require("neo-tree").setup({
	window = {
		mappings = {
			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
		}
	},
	event_handlers = {
	{
			event = "file_open_requested",
			handler = function()
				-- auto close
				-- vim.cmd("Neotree close")
				-- OR
				require("neo-tree.command").execute({ action = "close" })
			end
		},

	}
})
