return {
  {
    "nvim-mini/mini.ai",
    config = function()
      local gen_spec = require('mini.ai').gen_spec
      require("mini.ai").setup{
        custom_textobjects = {
          [','] = gen_spec.argument()
        }
      }
    end
  }
}
