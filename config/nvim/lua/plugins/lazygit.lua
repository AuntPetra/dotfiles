return {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- Set a keymap to open LazyGit.
        -- '<leader>gg' is a popular choice for 'Git Go!'
        vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
    end,
}
