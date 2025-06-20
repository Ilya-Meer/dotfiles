return{
  "giuxtaposition/blink-cmp-copilot",
  dependencies = { "zbirenbaum/copilot.lua" },
  event = { "InsertEnter" },
 config = function()
    require("blink-cmp-copilot") -- Just require it; no setup() call needed
  end,
}
