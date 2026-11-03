 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#f5fafd',
    base01 = '#eaeef2',
    base02 = '#e4e9ec',
    base03 = '#70787d',
    base04 = '#40484c',
    base05 = '#171c1f',
    base06 = '#171c1f',
    base07 = '#171c1f',
    base08 = '#ba1a1a',
    base09 = '#5c5b7d',
    base0A = '#4c616b',
    base0B = '#0e6681',
    base0C = '#c5c3ea',
    base0D = '#8ad0ee',
    base0E = '#b4cad5',
    base0F = '#cfe6f2',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#171c1f',          bg = '#f5fafd' })
  hi('TelescopeBorder',         { fg = '#70787d',             bg = '#f5fafd' })
  hi('TelescopePromptNormal',   { fg = '#171c1f',          bg = '#f5fafd' })
  hi('TelescopePromptBorder',   { fg = '#70787d',             bg = '#f5fafd' })
  hi('TelescopePromptPrefix',   { fg = '#0e6681',             bg = '#f5fafd' })
  hi('TelescopePromptCounter',  { fg = '#40484c',  bg = '#f5fafd' })
  hi('TelescopePromptTitle',    { fg = '#f5fafd',             bg = '#0e6681' })
  hi('TelescopePreviewTitle',   { fg = '#f5fafd',             bg = '#4c616b' })
  hi('TelescopeResultsTitle',   { fg = '#f5fafd',             bg = '#5c5b7d' })
  hi('TelescopeSelection',      { fg = '#171c1f',          bg = '#e4e9ec' })
  hi('TelescopeSelectionCaret', { fg = '#0e6681',             bg = '#e4e9ec' })
  hi('TelescopeMatching',       { fg = '#0e6681',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#171c1f',          bg = '#f5fafd' })
  hi('MiniPickBorder',         { fg = '#70787d',             bg = '#f5fafd' })
  hi('MiniPickPrompt',   { fg = '#171c1f',          bg = '#f5fafd' })
  hi('MiniPickPromptPrefix',   { fg = '#0e6681',             bg = '#f5fafd' })
  hi('MiniPickBorderText',    { fg = '#f5fafd',             bg = '#0e6681' })
  hi('MiniPickMatchCurrent',      { fg = '#171c1f',          bg = '#e4e9ec' })
  hi('MiniPickPromptCaret', { fg = '#0e6681',             bg = '#e4e9ec' })
  hi('MiniPickMatchRanges',       { fg = '#0e6681',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
