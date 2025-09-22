-- Load NvChad's default LSP configuration (diagnostics, capabilities, etc.)
require("nvchad.configs.lspconfig").defaults()

-- nvim-cmp / other completion capabilities are already set by NvChad defaults
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- If you later add cmp_nvim_lsp you can extend here; NvChad already does typical setup.

local on_attach = function(client, bufnr)
	-- Example buffer local keymaps (avoid overriding user mappings if already defined)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
	end
	map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
	map("n", "gr", vim.lsp.buf.references, "References")
	map("n", "K", vim.lsp.buf.hover, "Hover")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
	map("n", "<leader>fm", function()
		vim.lsp.buf.format { async = true }
	end, "Format")

	-- Disable semantic tokens quickly if you dislike their highlight blending
	-- if client.server_capabilities.semanticTokensProvider then
	--   client.server_capabilities.semanticTokensProvider = nil
	-- end
end

-- List of simple servers that need no special configuration
local basic_servers = {
	"html",
	"cssls",
}

-- Define server configurations using the new vim.lsp.config API (Neovim 0.11+)
-- See :help vim.lsp.config

-- Basic servers
for _, name in ipairs(basic_servers) do
	vim.lsp.config[name] = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- TypeScript / JavaScript (tsserver) with enhanced preferences
vim.lsp.config.tsserver = {
	on_attach = function(client, bufnr)
		-- Disable tsserver formatting; let conform.nvim (prettier) handle it
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client, bufnr)
		-- Optional: auto inlay hints (Neovim 0.10+)
		if vim.lsp.inlay_hint then
			pcall(vim.lsp.inlay_hint, bufnr, true)
		end
	end,
	capabilities = capabilities,
	settings = {
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
			suggest = { completeFunctionCalls = true },
			format = { enable = false },
			preferences = {
				quoteStyle = "auto",
				importModuleSpecifierPreference = "non-relative",
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
			suggest = { completeFunctionCalls = true },
			format = { enable = false },
			preferences = {
				quoteStyle = "auto",
				importModuleSpecifierPreference = "non-relative",
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
			},
		},
	},
}

-- C# (OmniSharp) configuration
local function exists(p)
	return p and vim.uv.fs_stat(p) ~= nil
end

local mason_root = vim.fn.stdpath("data") .. "/mason/packages"
local omnisharp_bin = mason_root .. "/omnisharp/omnisharp" -- new Roslyn-based .net 6+ build (unix)
local omnisharp_exe = mason_root .. "/omnisharp/OmniSharp" -- legacy capitalized
local chosen_omnisharp = nil
if exists(omnisharp_bin) then
	chosen_omnisharp = omnisharp_bin
elseif exists(omnisharp_exe) then
	chosen_omnisharp = omnisharp_exe
end

vim.lsp.config.omnisharp = {
	on_attach = on_attach,
	capabilities = capabilities,
	enable_import_completion = true,
	organize_imports_on_format = true,
	enable_roslyn_analyzers = true,
	handlers = {
		["textDocument/definition"] = function(_, result, params)
			if result and result[1] then
				return vim.lsp.handlers["textDocument/definition"](_, result[1], params)
			end
			return vim.lsp.handlers["textDocument/definition"](_, result, params)
		end,
	},
	cmd = chosen_omnisharp and { chosen_omnisharp, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) } or nil,
}

local enable_csharp_ls = false
if not chosen_omnisharp then
	enable_csharp_ls = true
	vim.schedule(function()
		vim.notify("omnisharp binary not found in mason; falling back to csharp_ls", vim.log.levels.WARN)
	end)
end

-- Detect INVALID_SERVER_MESSAGE scenario heuristically: allow user to set env to disable omnisharp
if vim.env.OMNISHARP_FORCE_CSHARP_LS == "1" then
	enable_csharp_ls = true
end

if enable_csharp_ls then
	vim.lsp.config.csharp_ls = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- Alternative: csharp_ls (uncomment to use)
-- vim.lsp.config.csharp_ls = {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- Enable all configured servers
local enabled = { unpack(basic_servers) }
table.insert(enabled, "tsserver")
if enable_csharp_ls then
	table.insert(enabled, "csharp_ls")
else
	table.insert(enabled, "omnisharp")
end
vim.lsp.enable(enabled)

-- read :h vim.lsp.config for changing options of lsp servers
