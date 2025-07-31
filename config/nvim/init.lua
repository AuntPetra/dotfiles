local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins", {
  -- This is the options table for lazy.nvim
  checker = {
    -- This will automatically check for plugin updates on startup
    -- The UI will pop up if new updates are found.
    enabled = true,
    frequency = 86400, -- Check for updates every 24 hours
  },
})
