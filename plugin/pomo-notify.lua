if vim.g.loaded_pomo_notify then
	return
end
vim.g.loaded_pomo_notify = true

-- Carica automaticamente il plugin
require("pomo_notify").setup()
