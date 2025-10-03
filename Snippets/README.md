# Snippets Directory

This directory contains organized snippet definitions for various languages and filetypes.

## Structure

```
Snippets/
├── loader.lua              # Snippet loader utility
└── tex/                     # LaTeX snippets
    ├── document_structure.lua   # Document structure snippets (template, sections, etc.)
    ├── environments.lua         # Environment snippets (lists, figures, tables)
    ├── math.lua                # Mathematical snippets (equations, fractions, etc.)
    ├── theorems.lua            # Theorem environments
    ├── formatting.lua          # Text formatting and references
    └── symbols.lua             # Mathematical symbols and Greek letters
```

## Adding New Snippets

### For LaTeX
1. Choose the appropriate category file in `tex/` or create a new one
2. Add your snippet using the LuaSnip syntax
3. The loader will automatically pick up all `.lua` files in the `tex/` directory

### For Other Languages
1. Create a new directory for the language (e.g., `markdown/`, `python/`)
2. Add snippet files in that directory
3. Update `loader.lua` to include the new language in `load_all_snippets()`

## Example Snippet Structure

```lua
local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  s("trigger", t("expansion text")),
  s("another", i(1, "placeholder")),
}
```

## Benefits of This Structure

- **Separation of Concerns**: Snippets are separated from plugin configuration
- **Modularity**: Easy to organize snippets by category or functionality  
- **Maintainability**: Each file focuses on a specific aspect of the language
- **Extensibility**: Easy to add new languages or categories
- **Reusability**: Snippet files can be shared or version controlled independently
