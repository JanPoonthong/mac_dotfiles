return {
  'Kolkhis/streamer-mode.nvim',
  config = function()
    require('streamer-mode').setup({ default_state = 'on' })
  end
}
