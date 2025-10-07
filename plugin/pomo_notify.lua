-- plugins/pomo_notify.lua
-- Plugin LazyVim per caricare il modulo pomo_notify in sicurezza

local ok, pomo_notify = pcall(require, "pomo_notify")

if not ok then
	vim.notify(
		"Errore caricando pomo_notify: " .. (pomo_notify and tostring(pomo_notify) or "unknown error"),
		vim.log.levels.ERROR,
		{ title = "Plugin Error" }
	)
	return
end

if type(pomo_notify) ~= "table" or not pomo_notify.setup then
	vim.notify("Modulo pomo_notify non valido o setup mancante", vim.log.levels.ERROR, { title = "Plugin Error" })
	return
end

-- Se tutto è ok, chiama setup
pomo_notify.setup({
	sound = true, -- riproduce suono alla fine del timer
	use_terminal_beep = false, -- se true usa beep del terminale
	sound_cmd = "paplay /usr/share/sounds/freedesktop/stereo/complete.oga &",
	timeout = 4000, -- durata notifica in ms
})
