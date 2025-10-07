-- lua/pomo_notify/init.lua
local M = {}

--- Setup function
--- @param opts table|nil
function M.setup(opts)
	local ok_pomo, pomo = pcall(require, "pomo")
	local ok_notify, notify = pcall(require, "notify")

	if not ok_pomo then
		vim.notify("pomo.nvim non trovato", vim.log.levels.ERROR)
		return
	end

	if not ok_notify then
		vim.notify("nvim-notify non trovato", vim.log.levels.ERROR)
		return
	end

	vim.notify = notify

	opts = vim.tbl_deep_extend("force", {
		sound = true,
		use_terminal_beep = true,
		sound_cmd = "paplay /usr/share/sounds/freedesktop/stereo/complete.oga &",
		timeout = 4000,
	}, opts or {})

	pomo.setup({
		on_timer_end = function(timer)
			local label = timer.label or "Timer"
			local minutes = math.floor(timer.duration / 60)

			notify(string.format("⏰ %s (%d min) terminato!", label, minutes), "info", {
				title = "Pomo Timer",
				timeout = opts.timeout,
			})

			if opts.use_terminal_beep then
				vim.cmd("echo '\\a'")
			elseif opts.sound then
				vim.fn.system(opts.sound_cmd)
			end
		end,
	})
end

return M
