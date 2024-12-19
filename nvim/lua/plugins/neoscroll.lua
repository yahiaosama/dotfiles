return {
  "karb94/neoscroll.nvim",
  keys = {
    {
      "<Up>",
      function()
        require("neoscroll").scroll(-0.1, { move_cursor = false, duration = 50 })
      end,
      desc = "Smooth scrolling up",
    },
    {
      "<Down>",
      function()
        require("neoscroll").scroll(0.1, { move_cursor = false, duration = 50 })
      end,
      desc = "Smooth scrolling down",
    },
  },
}
