return {
  "vague2k/vague.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("vague").setup({
      style = {
        boolean = "none",
        number = "none",
        float = "none",
        error = "none",
        comments = "none",
        conditionals = "none",
        functions = "none",
        headings = "bold",
        operators = "none",
        strings = "none",
        variables = "none",
        keywords = "none",
        keyword_return = "none",
        keywords_loop = "none",
        keywords_label = "none",
        keywords_exception = "none",
      },
    })
    vim.cmd("colorscheme vague")
  end
}
