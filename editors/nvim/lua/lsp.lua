vim.lsp.config("lua_ls", {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml'
  }
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '--offset-encoding=utf-8',
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
})

vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function ()
    print("LSP Attached")
  end
})
