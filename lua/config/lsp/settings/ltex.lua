local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
	table.insert(words, word)
end

return {
	settings = {
		ltex = {
			language = "en-US",
			dictionary = {
				["en-US"] = words,
			},
			-- disabledRules = { ["en-US"] = { "MORFOLOGIK_RULE_EN_US" } },
		},
	},
	-- additionalRules = {
	-- 	enablePickyRules = false,
	-- 	languageModel = "",
	-- 	motherTongue = "",
	-- 	neuralNetworkModel = "",
	-- 	word2VecModel = "",
	-- },
	-- java = {
	-- 	initialHeapSize = 64,
	-- 	maximumHeapSize = 512,
	-- 	path = "",
	-- },
	-- bibtex = { fields = {} },
	-- checkFrequency = "edit",
	-- clearDiagnosticsWhenClosingFile = true,
	-- completionEnabled = false,
	-- language = "en-US",
	-- languageToolHttpServerUri = "",
	-- languageToolOrg = {
	-- 	apiKey = "",
	-- 	username = "",
	-- },
	-- latex = {
	-- 	commands = {},
	-- 	environments = {},
	-- },
	-- ltex_ls = {
	-- 	languageToolHttpServerUri = "",
	-- 	languageToolOrgApiKey = "",
	-- 	languageToolOrgUsername = "",
	-- 	logLevel = "fine",
	-- 	path = "",
	-- },
	-- markdown = { nodes = {} },
	-- sentenceCacheSize = 2000,
	-- statusBarItem = false,
	-- trace = { server = "off" },
}

-- → ltex.configurationTarget
-- → ltex.diagnosticSeverity (alt. 1)
-- → ltex.diagnosticSeverity (alt. 2)
-- → ltex.disabledRules
-- → ltex.enabled (alt. 1)
-- → ltex.enabled (alt. 2)
-- → ltex.enabledRules
-- → ltex.hiddenFalsePositives
