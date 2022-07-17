local colorscheme = "moonfly"

vim.g.moonflyTransparent = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
