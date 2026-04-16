local M = {}

local CHARSETS = {
  lower = 'abcdefghijklmnopqrstuvwxyz',
  upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  digit = '0123456789',
  symbol = '!@#$%^&*()-_=+[]{};:,.<>/?~',
}

math.randomseed(os.time() + vim.loop.hrtime() % 1e9)

local function pick(str)
  local i = math.random(#str)
  return str:sub(i, i)
end

local function shuffle(t)
  for i = #t, 2, -1 do
    local j = math.random(i)
    t[i], t[j] = t[j], t[i]
  end
  return t
end

function M.generate(opts)
  opts = opts or {}
  local length = opts.length or 20
  local pools = {}
  local required = {}

  if opts.lower ~= false then
    table.insert(pools, CHARSETS.lower)
    table.insert(required, pick(CHARSETS.lower))
  end
  if opts.upper ~= false then
    table.insert(pools, CHARSETS.upper)
    table.insert(required, pick(CHARSETS.upper))
  end
  if opts.digit ~= false then
    table.insert(pools, CHARSETS.digit)
    table.insert(required, pick(CHARSETS.digit))
  end
  if opts.symbol ~= false then
    table.insert(pools, CHARSETS.symbol)
    table.insert(required, pick(CHARSETS.symbol))
  end

  if #pools == 0 then
    return nil, 'no character sets enabled'
  end
  if length < #required then
    return nil, 'length shorter than number of required character classes'
  end

  local all = table.concat(pools)
  local out = {}
  for _, c in ipairs(required) do table.insert(out, c) end
  for _ = #required + 1, length do
    table.insert(out, pick(all))
  end
  return table.concat(shuffle(out))
end

local function parse_args(fargs)
  local opts = {}
  for _, a in ipairs(fargs) do
    local n = tonumber(a)
    if n then
      opts.length = n
    elseif a == 'nosym' or a == 'no-symbol' then
      opts.symbol = false
    elseif a == 'nodigit' then
      opts.digit = false
    elseif a == 'noupper' then
      opts.upper = false
    elseif a == 'nolower' then
      opts.lower = false
    elseif a == 'alnum' then
      opts.symbol = false
    end
  end
  return opts
end

function M.insert(opts)
  local pw, err = M.generate(opts)
  if not pw then
    vim.notify('Password: ' .. err, vim.log.levels.ERROR)
    return
  end
  local mode = vim.api.nvim_get_mode().mode
  if mode:sub(1, 1) == 'i' then
    vim.api.nvim_put({ pw }, 'c', false, true)
  else
    vim.api.nvim_put({ pw }, 'c', true, true)
  end
end

function M.yank(opts)
  local pw, err = M.generate(opts)
  if not pw then
    vim.notify('Password: ' .. err, vim.log.levels.ERROR)
    return
  end
  vim.fn.setreg('+', pw)
  vim.fn.setreg('"', pw)
  vim.notify('Password (' .. #pw .. ' chars) copied to clipboard', vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('PasswordGen', function(cmd)
  M.insert(parse_args(cmd.fargs))
end, {
  nargs = '*',
  desc = 'Insert a generated password at cursor. Args: <length> nosym nodigit noupper nolower alnum',
})

vim.api.nvim_create_user_command('PasswordYank', function(cmd)
  M.yank(parse_args(cmd.fargs))
end, {
  nargs = '*',
  desc = 'Copy a generated password to clipboard. Args: <length> nosym nodigit noupper nolower alnum',
})

vim.keymap.set({ 'n', 'i' }, '<leader>pg', function() M.insert() end,
  { desc = 'Generate password (insert at cursor)', silent = true })
vim.keymap.set('n', '<leader>py', function() M.yank() end,
  { desc = 'Generate password (yank to clipboard)', silent = true })

return M
