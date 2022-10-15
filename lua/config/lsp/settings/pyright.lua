return {
    settings = {

        pyright = {
            disableLanguageService = false,
            disableOrganizeImports = false,
        },

        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                extraPaths = "[]",
                logLevel = "Information",
                stubPath = "typings",
                typeCheckingMode = "basic",
                typeshedPaths = "[]",
                useLibraryCodeForTypes = false,
            },
            pythonPath = "python",
            venvPath = "",
        },
    },
}
