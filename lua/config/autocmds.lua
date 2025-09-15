-- #########################################################################################
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- #########################################################################################


-- Auto-Saving for NVIM
require("config.autocmds.autosaving")

-- Fix fzf-lua colors for CyberDream
require("config.autocmds.fzf-lua-colors")