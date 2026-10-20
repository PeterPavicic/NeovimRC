---@type LazySpec
return {
  {
    "benlubas/molten-nvim",
    -- The remote plugin itself loads on its first command. Loading eagerly only adds lua/ to the
    -- runtimepath, which its python side requires and :UpdateRemotePlugins needs to see the plugin.
    -- image.nvim is not a dependency so it stays lazy: it loads when molten requires "image"
    lazy = false,
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = require("config.molten-nvim").init,
  },
}
