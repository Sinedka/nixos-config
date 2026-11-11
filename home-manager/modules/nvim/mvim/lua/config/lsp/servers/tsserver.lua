local api = require("typescript-tools.api")

return {
    handlers = {
        ["textDocument/publishDiagnostics"] = api.filter_diagnostics({
            -- Add diagnostic codes to ignore here.
        }),
    },

    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr }

        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, {
                buffer = bufnr,
                desc = desc,
            })
        end

        map("<leader>co", "<cmd>TSToolsOrganizeImports<CR>", "Organize imports")
        map("<leader>ci", "<cmd>TSToolsAddMissingImports<CR>", "Add missing imports")
        map("<leader>cu", "<cmd>TSToolsRemoveUnused<CR>", "Remove unused")
        map("<leader>cR", "<cmd>TSToolsRenameFile<CR>", "Rename file")
    end,

    settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",

        expose_as_code_action = {
            "fix_all",
            "add_missing_imports",
            "remove_unused",
            "remove_unused_imports",
            "organize_imports",
        },

        tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            importModuleSpecifierPreference = "non-relative",
        },

        tsserver_format_options = {
            allowIncompleteCompletions = false,
            allowRenameOfImportPath = true,
        },
    },
}
