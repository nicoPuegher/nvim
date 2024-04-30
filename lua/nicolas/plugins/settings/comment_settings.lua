local function comment_settings()
	return {
		toggler = {
			line = 'tc', -- line-comment toggle
			block = 'tb', -- block-comment toggle
		},
		opleader = {
			line = 'mc', -- line-comment keymap
			block = 'mb', -- block-comment keymap
		},
		extra = {
			above = 'mcO', -- add comment on line above
			below = 'mco', -- add comment on line below
			eol = 'mcA', -- add comment at end of line
		},
		-- if mappings = false, then no mappings will be created
		mappings = {
			basic = true, -- operator-pending mapping: `tc` `tb` `mc[count]{motion}` `mb[count]{motion}`
			extra = true, -- extra mappings: `mco` `mc0` `mcA`
		},
	}
end

return comment_settings
