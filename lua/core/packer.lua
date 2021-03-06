vim.cmd "packadd packer.nvim"

local present, packer = pcall(require, "packer")

if not present then
  local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  print "Cloning packer.."
  -- remove the dir before cloning
  vim.fn.delete(packer_path, "rf")
  vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  }

  vim.cmd "packadd packer.nvim"
  present, packer = pcall(require, "packer")

  if present then
    print "Packer cloned successfully."
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path)
  end
end

return packer.init {
  display = {
    prompt_border = "single",
  },
  git = {
    clone_timeout = 6000, -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
  autoremove = true,
  compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
}
