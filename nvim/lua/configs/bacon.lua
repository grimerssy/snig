local n = require('keymap').nnoremap

n('<C-n>', '<CMD>BaconLoad<CR><CMD>BaconNext<CR>zzzv')
n('<C-p>', '<CMD>BaconLoad<CR><CMD>BaconPrev<CR>zzzv')
