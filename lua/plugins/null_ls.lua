-- https://github.com/jose-elias-alvarez/null-ls.nvim
return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- general
                null_ls.builtins.completion.spell,

                -- json
                null_ls.builtins.formatting.jq,

                -- lua
                null_ls.builtins.formatting.stylua,

                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.pyproject_flake8,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.diagnostics.pydocstyle,

                -- markdown
                null_ls.builtins.formatting.markdownlint,
            },
        })
        local augroup = vim.api.nvim_create_augroup("null-ls", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            group = augroup,
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end,
}
