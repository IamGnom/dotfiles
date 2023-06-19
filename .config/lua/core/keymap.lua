local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


-- remap tab as leader
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = '<Tab>'
vim.g.maplocalleader = '<Tab>'

-- barbar
-- Goto buffer in position...
map('n', '<Space>0', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<Space>1', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<Space>2', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<Space>3', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<Space>4', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<Space>5', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<Space>6', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<Space>7', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<Space>8', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<Space>-1', '<Cmd>BufferLast<CR>', opts)

-- Close buffer
map('n', '<Space>q', '<Cmd>BufferClose<CR>', opts)

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)


-- focus window manager
map('n', '<Space>h', ':FocusSplitLeft<CR>', opts)
map('n', '<Space>j', ':FocusSplitDown<CR>', opts)
map('n', '<Space>k', ':FocusSplitUp<CR>', opts)
map('n', '<Space>l', ':FocusSplitRight<CR>', opts)


-- telescope general
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Space>tf', builtin.find_files, {})
vim.keymap.set('n', '<Space>tg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>tb', builtin.buffers, {})
vim.keymap.set('n', '<Space>th', builtin.help_tags, {})
vim.keymap.set('n', '<Space>te', vim.cmd.Telescope, {})

-- telescope git
vim.keymap.set('n', '<Space>gb', builtin.git_branches, {})
vim.keymap.set('n', '<Space>gc', builtin.git_commits, {})
vim.keymap.set('n', '<Space>gC', builtin.git_bcommits, {})
vim.keymap.set('n', '<Space>gs', builtin.git_status, {})
vim.keymap.set('n', '<Space>gS', builtin.git_stash, {})
vim.keymap.set('n', '<Space>gf', builtin.git_files, {})


-- gitsigns
require('gitsigns').setup {
	  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<Space>ss', gs.stage_hunk)
    map('n', '<Space>sr', gs.reset_hunk)
    map('v', '<Space>ss', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
    map('v', '<Space>sr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
    map('n', '<Space>sS', gs.stage_buffer)
    map('n', '<Space>su', gs.undo_stage_hunk)
    map('n', '<Space>sR', gs.reset_buffer)
    map('n', '<Space>sp', gs.preview_hunk)
    map('n', '<Space>sb', function() gs.blame_line{full=true} end)
    map('n', '<Space>sd', gs.diffthis)
    map('n', '<Space>sD', function() gs.diffthis('~') end)
    map('n', '<Space>tb', gs.toggle_current_line_blame)
    map('n', '<Space>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
