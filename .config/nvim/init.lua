require("config.lazy")
require("config.keymaps")
require("config.vim-options")
require("config.vim-commands")
require("config.buf-options")
require('custom.diagnostic').exclude({
  { code = 80001, source = 'typescript', reason = 'yes I know already!' }
})
