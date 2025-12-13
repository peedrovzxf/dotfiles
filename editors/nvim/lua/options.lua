require "nvchad.options"

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber = true
o.guicursor = "n-v-c:block,i-ci-ve:block"

o.incsearch = true   -- Show search results while typing
o.hlsearch = true    -- Highlight all matches
o.ignorecase = true  -- Ignore case in searches...
o.smartcase = true   -- ...unless uppercase is used
