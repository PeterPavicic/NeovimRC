---@type LazySpec
return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      options = {
        hex = {
          rrggbbaa = true,
        },
      },
    },
  },
}
