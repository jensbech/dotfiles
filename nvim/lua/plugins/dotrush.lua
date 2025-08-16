return {
  -- DotRush LSP for C#
  {
    "JaneySprings/DotRush",
    lazy = false,
    build = function()
      -- Install DotRush bundle if missing
      local base_dir = vim.fn.stdpath("data") .. "/dotrush"
      local binary = base_dir .. "/DotRush"
      if vim.fn.executable(binary) == 0 then
        print("[DotRush] Installing language server bundle…")
        vim.fn.system("mkdir -p " .. base_dir)

        local machine = (vim.uv or vim.loop).os_uname().machine or "x86_64"
        local arch = (machine:match("arm64") or machine:match("aarch64")) and "arm64" or "x64"
        local asset = string.format("DotRush.Bundle.Server_osx-%s.zip", arch)

        local tmp = vim.fn.tempname() .. ".zip"
        local url = string.format("https://github.com/JaneySprings/DotRush/releases/latest/download/%s", asset)
        local dl = vim.fn.system(string.format("curl -fL %s -o %s", url, tmp))
        if vim.v.shell_error ~= 0 then
          vim.notify("[DotRush] Download failed: " .. tostring(dl), vim.log.levels.ERROR)
          return
        end
        local uz = vim.fn.system(string.format("unzip -o %s -d %s", tmp, base_dir))
        if vim.v.shell_error ~= 0 then
          vim.notify("[DotRush] Unzip failed: " .. tostring(uz), vim.log.levels.ERROR)
          return
        end
        vim.fn.system(string.format("chmod +x %s", binary))
        -- Backward compat: legacy path name used earlier
        local legacy = base_dir .. "/DotRush.Server"
        if vim.fn.filereadable(legacy) == 1 then
          vim.fn.delete(legacy)
        end
        -- Create a tiny shim so existing paths still work
        local fh = io.open(legacy, "w")
        if fh then
          fh:write("#!/bin/sh\nexec \"" .. binary .. "\" \"$@\"\n")
          fh:close()
          vim.fn.system(string.format("chmod +x %s", legacy))
        end
        print("[DotRush] Installed to " .. base_dir)
      end
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- Configure DotRush
      local lspconfig = require("lspconfig")
      
      -- Register DotRush as a custom LSP server
      local configs = require("lspconfig.configs")
      
      -- Discover solution/project files under current working directory
      local function find_targets()
        local cwd = vim.fn.getcwd()
        local function uniq(t)
          local seen, res = {}, {}
          for _, v in ipairs(t) do
            if not seen[v] then seen[v] = true; table.insert(res, v) end
          end
          return res
        end
        local sln = vim.fn.globpath(cwd, "**/*.sln", 0, 1)
        local csproj = vim.fn.globpath(cwd, "**/*.csproj", 0, 1)
        local all = {}
        for _, p in ipairs(sln) do table.insert(all, p) end
        for _, p in ipairs(csproj) do table.insert(all, p) end
        return uniq(all)
      end
      
      if not configs.dotrush then
        local dotrush_path = vim.fn.stdpath("data") .. "/dotrush/DotRush"
        
        configs.dotrush = {
          default_config = {
            cmd = { dotrush_path },
            filetypes = { "cs", "xaml", "csproj", "sln", "fsproj", "vbproj" },
            -- DotRush recommends using the current working directory as root for NeoVim
            -- See: src/NeoVim/Readme.md in the DotRush repo
            root_dir = function(_)
              return vim.fn.getcwd()
            end,
            settings = {
              dotrush = {
                roslyn = {
                  projectOrSolutionFiles = find_targets(),
                },
              },
            },
            init_options = {},
          },
        }
      end
      
      -- Setup DotRush LSP with LazyVim defaults
      lspconfig.dotrush.setup({})

      -- Refresh settings when changing directory or opening C# buffers
      vim.api.nvim_create_autocmd({ "DirChanged", "BufEnter" }, {
        group = vim.api.nvim_create_augroup("DotRushRefresh", { clear = true }),
        pattern = { "*.cs", "*.sln", "*.csproj" },
        callback = function()
          local clients = vim.lsp.get_active_clients({ name = "dotrush" })
          if #clients > 0 then
            local settings = {
              dotrush = {
                roslyn = {
                  projectOrSolutionFiles = find_targets(),
                },
              },
            }
            for _, c in ipairs(clients) do
              c.config.settings = settings
              if c.notify then
                c:notify("workspace/didChangeConfiguration", { settings = settings })
              end
            end
          end
        end,
      })
    end,
  },

  -- Ensure C# syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c_sharp" })
      end
    end,
  },
}
