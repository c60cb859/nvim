require('fzf-lua').setup {
  global_resume = true,
  global_resume_query = true,
  winopts = {
    height = 0.30,
    width = 0.80,
    row = 0.50,
    col = 0.50,
    fullscreen = false,
  },
  files = {
    prompt = ' ',
  },
  grep = {
    prompt = ' ',
    continue_last_search = true,
  },
  buffers = {
    prompt = '﬘ ',
  },
}
