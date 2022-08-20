local alpha = require('alpha')

local if_nil = vim.F.if_nil

local default_terminal = {
  type = 'terminal',
  command = nil,
  width = 69,
  height = 8,
  opts = {
    redraw = true,
    window_config = {},
  },
}

local default_header = {
  type = 'text',
  val = {
    '           _____                    _____          ',
    '          /\\    \\                  /\\    \\         ',
    '         /::\\____\\                /::\\____\\        ',
    '        /::::|   |               /:::/    /        ',
    '       /:::::|   |              /:::/    /         ',
    '      /::::::|   |             /:::/    /          ',
    '     /:::/|::|   |            /:::/____/           ',
    '    /:::/ |::|   |            |::|    |            ',
    '   /:::/  |::|   | _____      |::|    |     _____  ',
    '  /:::/   |::|   |/\\    \\     |::|    |    /\\    \\ ',
    ' /:: /    |::|   /::\\____\\    |::|    |   /::\\____\\',
    ' \\::/    /|::|  /:::/    /    |::|    |  /:::/    /',
    '  \\/____/ |::| /:::/    /     |::|    | /:::/    / ',
    '          |::|/:::/    /      |::|____|/:::/    /  ',
    '          |::::::/    /       |:::::::::::/    /   ',
    '          |:::::/    /        \\::::::::::/____/    ',
    '          |::::/    /          ~~~~~~~~~~          ',
    '          /:::/    /                               ',
    '         /:::/    /                                ',
    '         \\::/    /                                 ',
    '          \\/____/                                  ',
  },
  opts = {
    position = 'center',
    hl = 'Type',
  },
}

local footer = {
  type = 'text',
  val = '',
  opts = {
    position = 'center',
    hl = 'Number',
  },
}

local leader = 'SPC'

local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

  local opts = {
    position = 'center',
    shortcut = sc,
    cursor = 5,
    width = 50,
    align_shortcut = 'right',
    hl_shortcut = 'Keyword',
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { 'n', sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc_ .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, 't', false)
  end

  return {
    type = 'button',
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = 'group',
  val = {
    button('n', '  New file', '<CMD>ene <CR>'),
    button('p', '  Open project', '<CMD>Telescope projects theme=dropdown previewer=false<CR>'),
    button('u', '  Update plugins', '<CMD>PackerSync<CR>'),
    button('q', '  Quit', '<CMD>q<CR>'),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  terminal = default_terminal,
  header = default_header,
  buttons = buttons,
  footer = footer,
}

local config = {
  layout = {
    { type = 'padding', val = 4 },
    section.header,
    { type = 'padding', val = 2 },
    section.buttons,
    section.footer,
  },
  opts = {
    margin = 5,
  },
}

alpha.setup(config)
