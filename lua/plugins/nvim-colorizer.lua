---@type LazySpec
return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      options = {
        parsers = {
          hex = {
            rrggbbaa = true,
          },
        },
      },
    },
  },
}
