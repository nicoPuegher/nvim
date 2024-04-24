return {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	config = function()
		local alpha = require('alpha')
		local dashboard = require('alpha.themes.dashboard')
		local alpha_settings = require('nicolas.plugins.settings.alpha_settings')

		alpha.setup(dashboard.opts)
		alpha_settings(dashboard)
	end,
}
