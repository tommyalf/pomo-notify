-- lua/pomo_notify/init.lua
local M = {}

function M.notify_timer_end(timer, opts)
	opts = vim.tbl_deep_extend("force", {
		sound = true,
		use_terminal_beep = true,
		sound_cmd = "paplay /usr/share/sounds/freedesktop/stereo/complete.oga &",
		timeout = 4000,
	}, opts or {})

	local ok_notify, notify = pcall(require, "notify")
	if not ok_notify then
		vim.notify("nvim-notify non trovato", vim.log.levels.ERROR)
		return
	end

	local label = timer.label or "Timer"
	local minutes = math.floor(timer.duration / 60)

	notify(string.format("⏰ %s (%d min) terminato!", label, minutes), "info", {
		title = "Pomo Timer",
		timeout = opts.timeout,
	})

	if opts.use_terminal_beep then
		vim.cmd("echo '\\a'")
	elseif opts.sound then
		vim.fn.jobstart({ "paplay", "/usr/share/sounds/freedesktop/stereo/complete.oga" }, { detach = true })
	end
end

return M
