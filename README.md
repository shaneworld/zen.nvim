# ZenFormat

中文文档格式化排版插件。

## 已实现功能

- [x] 在中文和英文之间添加空格

- [x] 在中文和数字之间添加空格

## TODO

- [ ] 数字和常用单位之间添加空格

- [ ] 全角标点和其他字符之间不添加空格

- [ ] 删除重复使用的标点符号

- [ ] 中文使用全角中文标点

- [ ] 遇到完整的英文整句、特殊名词，其内容使用半角标点

- [ ] 链接之间添加空格

## 安装

使用 `lazy.nvim`：

```lua
{
    "shaneworld/zen.nvim",
    require("zen").setup({
        -- 是否在保存文档时自动执行
        -- default: true
        auto_format = true,
        -- 手动执行的快捷键
        -- default: <leader>sp
        manual_format = "<leader>sp",
        -- 插件开启的文件类型
        -- defalut："*.md", "*.tex", "*.txt"
        file_type = {"*.md", "*.tex", "*.txt"}
    })
}
```

## 使用

默认情况下，每次保存文档时都会自动运行插件，也可以使用默认快捷键 `<leader>sp` 手动格式化。
