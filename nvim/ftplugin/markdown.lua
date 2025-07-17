local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

-- Add simple quote pairing
npairs.add_rules({
  Rule("“", "”", "text"),
  Rule("‘", "’", "text"),
})

