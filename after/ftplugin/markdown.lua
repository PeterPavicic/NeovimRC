-- CLAUDE: fold markdown based on treesitter sections

local function markdown_section_foldexpr()
  local lnum = vim.v.lnum - 1
  local parser = vim.treesitter.get_parser(0)
  if not parser then
    return "0"
  end

  local root = parser:parse()[1]:root()
  local node = root:named_descendant_for_range(lnum, 0, lnum, 0)
  if not node then
    return "0"
  end

  local depth = 0
  local n = node
  while n do
    if n:type() == "section" then
      depth = depth + 1
    end
    n = n:parent()
  end

  n = node
  while n do
    if n:type() == "atx_heading" or n:type() == "setext_heading" then
      if n:start() == lnum then
        return ">" .. depth
      end
    end
    n = n:parent()
  end

  return tostring(depth)
end

_G.markdown_section_foldexpr = markdown_section_foldexpr

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.markdown_section_foldexpr()"
vim.opt_local.foldlevel = 99
vim.opt_local.foldlevelstart = 99
vim.opt_local.foldminlines = 1
vim.opt_local.foldtext = ""
