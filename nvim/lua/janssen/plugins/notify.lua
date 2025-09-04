return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require('notify');

    notify.setup({
    -- Configuration options for the plugin
      background_colour = "Normal",
      fps = 30,
      icons = {
        ERROR = "❌",
        WARN = "⚠️",
        INFO = "❗️",
        DEBUG = "🔎",
        TRACE = "✎",
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      timeout = 5000,
      top_down = true,
    })
  end,
}
