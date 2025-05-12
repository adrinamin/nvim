-- Add the vim module to the global environment
package.loaded.vim = vim
_G.vim = vim
vim.env.LANGUAGE = "en_US.UTF-8"

require("adrin.core")
require("adrin.lazy")
