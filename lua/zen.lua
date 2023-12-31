local zen = {}

-- 中文与英文、中文与数字之间添加空格
local function add_space_between_cn_and_en()
  -- 获得当前光标位置
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  -- en and cn
  vim.cmd("silent! %s/\\([a-zA-Z]\\)\\([\\u4e00-\\u9fa5]\\)/\\1 \\2/g")
  vim.cmd("silent! %s/\\([\\u4e00-\\u9fa5]\\)\\([a-zA-Z]\\)/\\1 \\2/g")
  -- cn and numbers
  vim.cmd("silent! %s/\\([\\u4e00-\\u9fa5]\\)\\([0-9]\\)/\\1 \\2/g")
  vim.cmd("silent! %s/\\([0-9]\\)\\([\\u4e00-\\u9fa5]\\)/\\1 \\2/g")
  -- 光标回到原来位置
  vim.api.nvim_win_set_cursor(0, cursor_position)
end

local function setup(opt)
  zen = vim.tbl_extend("force", {
    auto_format = true,
    manual_format = "<leader>sp",
    file_type = {"*.md", "*.tex", "*.txt"}
  }, opt or {})
  vim.keymap.set("n", zen.manual_format, add_space_between_cn_and_en, {})
  -- autocmd
  if zen.auto_format then
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = zen.file_type,
      callback = add_space_between_cn_and_en
    })
  end
end

return {
  setup = setup
}
