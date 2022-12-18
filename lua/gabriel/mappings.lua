function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "sh", ":nohlsearch<cr>")

map("n", "ci1", "ci'")
map("n", "ci!", "ci\"")

map("n", "yi1", "yi'")
map("n", "yi!", "yi\"")

map("n", "vi1", "vi'")
map("n", "vi!", "vi\"")

map("n", "di1", "di'")
map("n", "di!", "di\"")
