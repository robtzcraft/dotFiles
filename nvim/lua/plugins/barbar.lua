
require('bufferline').setup({
  options = {
    mode = "buffers",
    numbers = "none",
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = " Files",
        highlight = "Directory",
        test_align = "left",
      },
    },
  },
})
