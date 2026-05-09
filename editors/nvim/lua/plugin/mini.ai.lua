return {
  {
    "nvim-mini/mini.ai",
    config = function()
      local gen_spec = require('mini.ai').gen_spec
      require("mini.ai").setup{
        custom_textobjects = {
          [','] = gen_spec.argument(),
          f = require("mini.ai").gen_spec.treesitter({
            a = "@function.outer",
            i = "@function.inner",
          },
          { use_nvim_treesitter = true }),
          c = require("mini.ai").gen_spec.treesitter({
            a = "@class.outer",
            i = "@class.inner",
          },
          { use_nvim_treesitter = true }),
        },
        n_lines = 500
      }
    end
  }
}
