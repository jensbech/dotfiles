-- DotRush LSP integration for Neovim
-- Requires the DotRush server executable; see https://github.com/JaneySprings/DotRush
-- Configure by placing a dotrush.config.json in your project root.
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre *.cs", "BufNewFile *.cs", "BufReadPre *.xaml", "BufNewFile *.xaml" },
    init = function()
      local ok, lspconfig = pcall(require, "lspconfig")
      if not ok then
        return
      end
      local configs = require("lspconfig.configs")
      local util = require("lspconfig.util")

      local function exists(path)
        if not path or path == "" then
          return false
        end
        local stat = (vim.uv or vim.loop).fs_stat(path)
        return stat and stat.type == "file"
      end

      local function resolve_dotrush_cmd()
        -- Priority: explicit env -> common names in PATH -> typical user bin paths
        local env = vim.env.DOTRUSH_PATH
        if env and #env > 0 and exists(env) then
          return { env }
        end

        local names = { "dotrush", "DotRush.Server", "DotRush" }
        for _, name in ipairs(names) do
          if vim.fn.executable(name) == 1 then
            return { name }
          end
        end

        local home = vim.env.HOME or "~"
        local candidates = {
          home .. "/bin/dotrush",
          home .. "/.local/bin/dotrush",
          "/usr/local/bin/dotrush",
          "/opt/homebrew/bin/dotrush",
        }
        for _, path in ipairs(candidates) do
          if exists(path) then
            return { path }
          end
        end

        -- Last resort: return a name so Neovim tries PATH; also warn user
        vim.schedule(function()
          vim.notify(
            "DotRush LSP: executable not found. Set $DOTRUSH_PATH to the server or put 'dotrush' in PATH.",
            vim.log.levels.ERROR
          )
        end)
        return { "dotrush" }
      end

      if not configs.dotrush then
        local cmd = resolve_dotrush_cmd()
        configs.dotrush = {
          default_config = {
            cmd = cmd,
            filetypes = { "cs", "xaml" },
            single_file_support = true,
            root_dir = function(fname)
              local function has_any(parent)
                if util.path.is_file(util.path.join(parent, "dotrush.config.json")) then
                  return true
                end
                local sln = vim.fn.glob(util.path.join(parent, "*.sln"), false, true)
                if sln and #sln > 0 then
                  return true
                end
                local csproj = vim.fn.glob(util.path.join(parent, "*.csproj"), false, true)
                if csproj and #csproj > 0 then
                  return true
                end
                if util.path.is_dir(util.path.join(parent, ".git")) then
                  return true
                end
                if util.path.is_file(util.path.join(parent, "global.json")) then
                  return true
                end
                if util.path.is_file(util.path.join(parent, "Directory.Build.props")) then
                  return true
                end
                return false
              end
              local root = util.search_ancestors(fname, function(path)
                if has_any(path) then
                  return path
                end
              end)
              return root or vim.fn.getcwd()
            end,
          },
        }
      end

      -- Provide a small debug command to inspect DotRush setup
      vim.api.nvim_create_user_command("DotRushInfo", function()
        local cmd = (configs.dotrush and configs.dotrush.default_config and configs.dotrush.default_config.cmd) or {}
        local buf = vim.api.nvim_get_current_buf()
        local name = vim.api.nvim_buf_get_name(buf)
        local root = (configs.dotrush and configs.dotrush.default_config.root_dir and configs.dotrush.default_config.root_dir(name))
          or "(nil)"
        vim.notify(
          table.concat({
            "DotRush Info:",
            "  DOTRUSH_PATH=" .. (vim.env.DOTRUSH_PATH or "(unset)"),
            "  cmd=" .. vim.inspect(cmd),
            "  root_dir=" .. tostring(root),
            "  filetype=" .. (vim.bo[buf].filetype or ""),
          }, "\n"),
          vim.log.levels.INFO
        )
      end, { desc = "Show DotRush LSP resolution info" })
    end,
    opts = function(_, opts)
      opts = opts or {}
      opts.servers = opts.servers or {}
      -- Use default_config from configs; no extra opts required for now
      opts.servers.dotrush = {}

      -- Let LazyVim handle setup
      opts.setup = opts.setup or {}
      opts.setup.dotrush = function()
        return false
      end

      return opts
    end,
  },
}
