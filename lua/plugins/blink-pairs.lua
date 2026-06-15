return {
  "saghen/blink.pairs",
  dependencies = "saghen/blink.lib",
  event = "InsertEnter",
  version = "*",
  -- download prebuilt binaries from github releases, must be on a versioned release
  -- build = function()
  --   require("blink.pairs").download():pwait(60000)
  -- end,
  -- OR build from source
  build = function()
    require("blink.pairs").build():pwait(60000)
  end,

  --- @module 'blink.pairs'
  --- @type blink.pairs.Config
  opts = require("config.blink-pairs"),
}
