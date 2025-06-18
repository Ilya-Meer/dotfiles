return{
  "giuxtaposition/blink-cmp-copilot",
  dependencies = { "zbirenbaum/copilot.lua" },
  lazy = false,
 config = function()
    require("blink-cmp-copilot") -- Just require it; no setup() call needed
  end,
}
