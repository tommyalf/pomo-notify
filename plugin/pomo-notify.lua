if vim.g.loaded_pomo_notify then
	return
end
vim.g.loaded_pomo_notify = true

-- Caricaautomaticamente il plugin
require("pomo_notify").setup()
