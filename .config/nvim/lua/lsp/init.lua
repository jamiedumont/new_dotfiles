
local on_attach = function()
  require'completion'.on_attach()
end

require'nvim_lsp'.elixirls.setup{
 cmd = { "/home/jamie/.elixir-ls/release/language-server.sh" }
}
