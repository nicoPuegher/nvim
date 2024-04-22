local function comment_settings()
	return {
		padding = true,
		sticky = true,
		ignore = nil,
		toggler = {
			line = 'gcc', -- line-comment toggle
			block = 'gbc', -- block-comment toggle
		},
		opleader = {
			line = 'gct', -- line-comment keymap
			block = 'gbt', -- block-comment keymap
		},
		extra = {
			above = 'gcO', -- add comment on line above
			below = 'gco', -- add comment on line below
			eol = 'gcA', -- add comment at end of line
		},
		-- if mappings = false, then no mappings will be created
		mappings = {
			basic = true, -- operator-pending mapping: `gcc` `gbc` `gc[count]{motion}` `gc[count]{motion}`
			extra = true, -- extra mappings: `gco` `gc0` `gcA`
		},
		pre_hook = nil,
		post_hook = nil,
	}
end

return comment_settings
