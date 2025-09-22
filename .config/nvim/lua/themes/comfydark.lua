-- ComfyDark theme for NvChad
-- Based on the VSCode ComfyDark theme

local M = {}

M.base_30 = {
  white = "#c9d1d9",
  darker_black = "#0a0e13",
  black = "#0d1117", --  nvim bg
  black2 = "#161b22",
  one_bg = "#161b22", -- real bg of onedark
  one_bg2 = "#1f2937",
  one_bg3 = "#30363d",
  grey = "#484f58",
  grey_fg = "#6e7681",
  grey_fg2 = "#7d8590",
  light_grey = "#8b949e",
  red = "#f85149",
  baby_pink = "#ffa7c4",
  pink = "#ff7eb6",
  line = "#30363d", -- for lines like vertsplit
  green = "#7ee787",
  vibrant_green = "#85e89d",
  nord_blue = "#58a6ff",
  blue = "#58a6ff",
  yellow = "#f9e2af",
  sun = "#ffcc00",
  purple = "#c586c0",
  dark_purple = "#a5a5ff",
  teal = "#39d0d8",
  orange = "#ff9500",
  cyan = "#76e3ea",
  statusline_bg = "#161b22",
  lightbg = "#1f2937",
  pmenu_bg = "#58a6ff",
  folder_bg = "#58a6ff",
}

M.base_16 = {
  base00 = "#0d1117", -- Default Background
  base01 = "#161b22", -- Lighter Background (Used for status bars, line number and folding marks)
  base02 = "#21262d", -- Selection Background
  base03 = "#30363d", -- Comments, Invisibles, Line Highlighting
  base04 = "#484f58", -- Dark Foreground (Used for status bars)
  base05 = "#c9d1d9", -- Default Foreground, Caret, Delimiters, Operators
  base06 = "#d0d7de", -- Light Foreground (Not often used)
  base07 = "#f0f6fc", -- Light Background (Not often used)
  base08 = "#f85149", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = "#ff9500", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = "#f9e2af", -- Classes, Markup Bold, Search Text Background
  base0B = "#7ee787", -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = "#76e3ea", -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = "#58a6ff", -- Functions, Methods, Attribute IDs, Headings
  base0E = "#c586c0", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = "#ffa7c4", -- Deprecated, Opening/Closing Embedded Language Tags
}

M.polish_hl = {
  -- Treesitter highlighting to match VSCode Dark+ exactly
  ["@variable"] = { fg = "#9CDCFE" }, -- Light blue for variables
  ["@variable.builtin"] = { fg = "#569CD6" }, -- Blue for built-in variables like 'this', 'self'
  ["@variable.parameter"] = { fg = "#9CDCFE" }, -- Light blue for parameters
  ["@variable.member"] = { fg = "#9CDCFE" }, -- Light blue for object properties
  
  ["@function"] = { fg = "#DCDCAA" }, -- Yellow for functions
  ["@function.builtin"] = { fg = "#DCDCAA" }, -- Yellow for built-in functions
  ["@function.method"] = { fg = "#DCDCAA" }, -- Yellow for methods
  ["@function.call"] = { fg = "#DCDCAA" }, -- Yellow for function calls
  
  ["@type"] = { fg = "#4EC9B0" }, -- Teal for types
  ["@type.builtin"] = { fg = "#569CD6" }, -- Blue for built-in types like 'string', 'number'
  ["@type.definition"] = { fg = "#4EC9B0" }, -- Teal for type definitions
  
  ["@keyword"] = { fg = "#569CD6" }, -- Blue for most keywords
  ["@keyword.control"] = { fg = "#C586C0" }, -- Purple for control flow (if, else, for, while)
  ["@keyword.function"] = { fg = "#569CD6" }, -- Blue for function keyword
  ["@keyword.operator"] = { fg = "#569CD6" }, -- Blue for operator keywords (new, instanceof)
  ["@keyword.return"] = { fg = "#C586C0" }, -- Purple for return
  ["@keyword.conditional"] = { fg = "#C586C0" }, -- Purple for if/else
  ["@keyword.repeat"] = { fg = "#C586C0" }, -- Purple for loops
  ["@keyword.import"] = { fg = "#C586C0" }, -- Purple for import/export
  ["@keyword.export"] = { fg = "#C586C0" }, -- Purple for export
  
  ["@string"] = { fg = "#CE9178" }, -- Orange for strings
  ["@string.escape"] = { fg = "#D7BA7D" }, -- Gold for escape sequences
  ["@string.regex"] = { fg = "#D16969" }, -- Red for regex
  
  ["@number"] = { fg = "#B5CEA8" }, -- Light green for numbers
  ["@number.float"] = { fg = "#B5CEA8" }, -- Light green for floats
  
  ["@comment"] = { fg = "#6A9955", italic = true }, -- Green for comments
  ["@comment.documentation"] = { fg = "#6A9955" }, -- Green for doc comments
  
  ["@constant"] = { fg = "#569CD6" }, -- Blue for constants
  ["@constant.builtin"] = { fg = "#569CD6" }, -- Blue for built-in constants
  ["@constant.macro"] = { fg = "#569CD6" }, -- Blue for macros
  
  ["@operator"] = { fg = "#D4D4D4" }, -- White/gray for operators
  ["@punctuation"] = { fg = "#D4D4D4" }, -- White/gray for punctuation
  ["@punctuation.bracket"] = { fg = "#D4D4D4" }, -- White/gray for brackets
  ["@punctuation.delimiter"] = { fg = "#D4D4D4" }, -- White/gray for delimiters
  
  ["@tag"] = { fg = "#569CD6" }, -- Blue for HTML/XML tags
  ["@tag.attribute"] = { fg = "#9CDCFE" }, -- Light blue for attributes
  ["@tag.delimiter"] = { fg = "#808080" }, -- Gray for tag delimiters
  
  -- LSP semantic tokens to match VSCode Dark+ exactly
  ["@lsp.type.class"] = { fg = "#4EC9B0" }, -- Teal for classes
  ["@lsp.type.enum"] = { fg = "#4EC9B0" }, -- Teal for enums
  ["@lsp.type.interface"] = { fg = "#4EC9B0" }, -- Teal for interfaces
  ["@lsp.type.namespace"] = { fg = "#4EC9B0" }, -- Teal for namespaces
  ["@lsp.type.parameter"] = { fg = "#9CDCFE" }, -- Light blue for parameters
  ["@lsp.type.property"] = { fg = "#9CDCFE" }, -- Light blue for properties
  ["@lsp.type.variable"] = { fg = "#9CDCFE" }, -- Light blue for variables
  ["@lsp.type.function"] = { fg = "#DCDCAA" }, -- Yellow for functions
  ["@lsp.type.method"] = { fg = "#DCDCAA" }, -- Yellow for methods
  ["@lsp.type.keyword"] = { fg = "#569CD6" }, -- Blue for keywords
  ["@lsp.type.string"] = { fg = "#CE9178" }, -- Orange for strings
  ["@lsp.type.number"] = { fg = "#B5CEA8" }, -- Light green for numbers
  ["@lsp.type.regexp"] = { fg = "#D16969" }, -- Red for regex
  ["@lsp.type.operator"] = { fg = "#D4D4D4" }, -- White/gray for operators
  ["@lsp.type.decorator"] = { fg = "#DCDCAA" }, -- Yellow for decorators
  ["@lsp.type.enumMember"] = { fg = "#4FC1FF" }, -- Light blue for enum members
  ["@lsp.type.typeParameter"] = { fg = "#4EC9B0" }, -- Teal for type parameters
  
  -- Additional highlight groups for exact VSCode matching
  Identifier = { fg = "#9CDCFE" }, -- Light blue for identifiers
  Function = { fg = "#DCDCAA" }, -- Yellow for functions
  Statement = { fg = "#569CD6" }, -- Blue for statements
  Conditional = { fg = "#C586C0" }, -- Purple for conditionals
  Repeat = { fg = "#C586C0" }, -- Purple for loops
  Label = { fg = "#C586C0" }, -- Purple for labels
  Operator = { fg = "#D4D4D4" }, -- White/gray for operators
  Keyword = { fg = "#569CD6" }, -- Blue for keywords
  Exception = { fg = "#C586C0" }, -- Purple for try/catch
  PreProc = { fg = "#569CD6" }, -- Blue for preprocessor
  Include = { fg = "#C586C0" }, -- Purple for includes/imports
  Define = { fg = "#569CD6" }, -- Blue for defines
  Macro = { fg = "#569CD6" }, -- Blue for macros
  PreCondit = { fg = "#569CD6" }, -- Blue for preprocessor conditionals
  Type = { fg = "#4EC9B0" }, -- Teal for types
  StorageClass = { fg = "#569CD6" }, -- Blue for storage classes
  Structure = { fg = "#4EC9B0" }, -- Teal for structures
  Typedef = { fg = "#4EC9B0" }, -- Teal for typedefs
  Special = { fg = "#D4D4D4" }, -- White/gray for special chars
  SpecialChar = { fg = "#D7BA7D" }, -- Gold for special chars in strings
  Tag = { fg = "#569CD6" }, -- Blue for tags
  Delimiter = { fg = "#D4D4D4" }, -- White/gray for delimiters
  SpecialComment = { fg = "#6A9955" }, -- Green for special comments
  Debug = { fg = "#569CD6" }, -- Blue for debug statements
  
  -- String related
  String = { fg = "#CE9178" }, -- Orange for strings
  Character = { fg = "#CE9178" }, -- Orange for characters
  Number = { fg = "#B5CEA8" }, -- Light green for numbers
  Boolean = { fg = "#569CD6" }, -- Blue for booleans
  Float = { fg = "#B5CEA8" }, -- Light green for floats
  
  -- Comments
  Comment = { fg = "#6A9955", italic = true }, -- Green for comments
  
  -- Constants
  Constant = { fg = "#569CD6" }, -- Blue for constants
  
  -- UI elements
  Normal = { fg = M.base_30.white, bg = M.base_30.black },
  NormalFloat = { bg = M.base_30.black2 },
  FloatBorder = { fg = M.base_30.one_bg3 },
  Pmenu = { bg = M.base_30.black2 },
  PmenuSel = { bg = "#1f6feb" },
  CursorLine = { bg = M.base_30.black2 },
  Visual = { bg = "#1f6feb" },
  Search = { bg = "#1f6feb" },
  IncSearch = { bg = "#1f6feb" },
  
  -- Status line
  StatusLine = { bg = M.base_30.statusline_bg },
  StatusLineNC = { bg = M.base_30.statusline_bg },
  
  -- Tabs
  TabLine = { bg = M.base_30.black },
  TabLineFill = { bg = M.base_30.black },
  TabLineSel = { bg = M.base_30.black2 },
  
  -- Sidebar and borders
  VertSplit = { fg = M.base_30.line },
  WinSeparator = { fg = M.base_30.line },
  SignColumn = { bg = M.base_30.black },
  
  -- Line numbers
  LineNr = { fg = M.base_30.grey },
  CursorLineNr = { fg = M.base_30.white },
  
  -- Git signs
  DiffAdd = { fg = M.base_30.green },
  DiffChange = { fg = M.base_30.yellow },
  DiffDelete = { fg = M.base_30.red },
  DiffText = { fg = M.base_30.white, bg = M.base_30.grey },
  
  -- Error and warning
  DiagnosticError = { fg = M.base_30.red },
  DiagnosticWarn = { fg = M.base_30.yellow },
  DiagnosticInfo = { fg = M.base_30.blue },
  DiagnosticHint = { fg = M.base_30.cyan },
  
  ErrorMsg = { fg = M.base_30.red },
  WarningMsg = { fg = M.base_30.yellow },
  
  -- Folding
  Folded = { fg = M.base_30.light_grey, bg = M.base_30.black2 },
  FoldColumn = { fg = M.base_30.grey },
  
  -- Matching
  MatchParen = { fg = M.base_30.white, bg = M.base_30.grey },
  
  -- Telescope
  TelescopeNormal = { bg = M.base_30.black },
  TelescopeBorder = { fg = M.base_30.one_bg3 },
  TelescopePromptBorder = { fg = M.base_30.one_bg3 },
  TelescopeResultsBorder = { fg = M.base_30.one_bg3 },
  TelescopePreviewBorder = { fg = M.base_30.one_bg3 },
  TelescopeSelection = { bg = M.base_30.black2 },
  TelescopeSelectionCaret = { fg = M.base_30.blue },
  
  -- NvimTree
  NvimTreeNormal = { bg = M.base_30.black },
  NvimTreeVertSplit = { fg = M.base_30.line },
  NvimTreeWinSeparator = { fg = M.base_30.line },
  NvimTreeRootFolder = { fg = M.base_30.blue },
  NvimTreeFolderIcon = { fg = M.base_30.blue },
  NvimTreeFileIcon = { fg = M.base_30.white },
  NvimTreeSpecialFile = { fg = M.base_30.yellow },
  NvimTreeGitDirty = { fg = M.base_30.red },
  NvimTreeGitNew = { fg = M.base_30.green },
  NvimTreeGitDeleted = { fg = M.base_30.red },
}

M.type = "dark"

return M