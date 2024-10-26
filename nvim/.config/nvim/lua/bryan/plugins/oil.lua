return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")
        oil.setup()
        vim.keymap.set(
            "n",
            "<leader>n",
            oil.toggle_float,
            { desc = "Toggle oil float" }
        )
    end,
}
