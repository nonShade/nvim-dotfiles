return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},

  -- Commands
  -- :RenderMarkdown 	require('render-markdown').enable() 	Enable this plugin
  -- :RenderMarkdown enable 	require('render-markdown').enable() 	Enable this plugin
  -- :RenderMarkdown buf_enable 	require('render-markdown').buf_enable() 	Enable this plugin for current buffer
  -- :RenderMarkdown disable 	require('render-markdown').disable() 	Disable this plugin
  -- :RenderMarkdown buf_disable 	require('render-markdown').buf_disable() 	Disable this plugin for current buffer
  -- :RenderMarkdown toggle 	require('render-markdown').toggle() 	Toggle state of this plugin
  -- :RenderMarkdown buf_toggle 	require('render-markdown').buf_toggle() 	Toggle state of this plugin for current buffer
  -- :RenderMarkdown log 	require('render-markdown').log() 	Opens the log file for this plugin
  -- :RenderMarkdown expand 	require('render-markdown').expand() 	Increase anti-conceal margin above and below by 1
  -- :RenderMarkdown contract 	require('render-markdown').contract() 	Decrease anti-conceal margin above and below by 1
  -- :RenderMarkdown debug 	require('render-markdown').debug() 	Prints information about marks on current line
  -- :RenderMarkdown config 	require('render-markdown').config() 	Prints difference between config and default
}
