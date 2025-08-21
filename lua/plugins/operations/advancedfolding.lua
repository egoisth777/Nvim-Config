-- lua/plugins/advancedfolding.lua
return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { 
      "kevinhwang91/promise-async",
      "neovim/nvim-lspconfig", -- Make sure LSP is available
      { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } -- Ensure treesitter is available
    },
    event = "BufReadPost", -- Load after buffer is read
    keys = {
      -- Add za, zR, zM keys to make sure they're available
      { "za", function() 
        local ok, err = pcall(function() 
          require("ufo").openFoldsExceptKinds() 
        end)
        if not ok then vim.cmd("normal! za") end
      end, desc = "Open fold under cursor" },
      { "zA", function() 
        local ok, err = pcall(function() 
          require("ufo").closeFoldsWith() 
        end)
        if not ok then vim.cmd("normal! zA") end
      end, desc = "Close fold under cursor" },
      { "zc", function() 
        local ok, err = pcall(function() 
          require("ufo").closeFoldsWith() 
        end)
        if not ok then vim.cmd("normal! zc") end
      end, desc = "Close fold under cursor" },
      { "zC", function() 
        local ok, err = pcall(function() 
          require("ufo").closeAllFolds() 
        end)
        if not ok then vim.cmd("normal! zC") end
      end, desc = "Close all folds" },
      { "zo", function() 
        local ok, err = pcall(function() 
          require("ufo").openFoldsExceptKinds() 
        end)
        if not ok then vim.cmd("normal! zo") end
      end, desc = "Open fold under cursor" },
      { "zO", function() 
        local ok, err = pcall(function() 
          require("ufo").openAllFolds() 
        end)
        if not ok then vim.cmd("normal! zO") end
      end, desc = "Open all folds" },
    },
    config = function(_, opts)
      -- Local vim reference to fix undefined global warnings
      local vim = vim
      
      -- Custom fold text handler
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, {suffix, 'MoreMsg'})
        return newVirtText
      end

      -- Custom provider selector with proper fallback handling
      local function customProviderSelector(bufnr, filetype, buftype)
        -- Define specific providers for certain filetypes
        local ftMap = {
          vim = 'indent',
          python = {'indent'},
          lua = {'treesitter', 'indent'},
        }
        
        -- Return provider based on filetype or use a custom function for fallback
        if ftMap[filetype] then
          return ftMap[filetype]
        else
          -- For other filetypes, try lsp first, then indent as fallback
          return function(bufnr)
            local function handleFallbackException(err, providerName)
              if type(err) == 'string' and err:match('UfoFallbackException') then
                return require('ufo').getFolds(bufnr, providerName)
              else
                return require('promise').reject(err)
              end
            end

            return require('ufo').getFolds(bufnr, 'lsp')
              :catch(function(err)
                return handleFallbackException(err, 'treesitter')
              end)
              :catch(function(err)
                return handleFallbackException(err, 'indent')
              end)
          end
        end
      end

      -- Merge our configuration with any passed options
      local config = vim.tbl_deep_extend("force", {
        open_fold_hl_timeout = 150,
        close_fold_kinds_for_ft = {
          default = {'imports', 'comment'},
          json = {'array'},
          c = {'comment', 'region'},
        },
        provider_selector = customProviderSelector,
        fold_virt_text_handler = handler,
        preview = {
          win_config = {
            border = 'rounded',
            winhighlight = 'Normal:Normal',
            winblend = 0
          },
        },
      }, opts or {})

      -- Set up UFO
      require("ufo").setup(config)

      -- Set foldcolumn after UFO is loaded
      vim.o.foldcolumn = '1'
      
      -- Ensure folding is enabled for the current buffer
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          -- Enable folding for this buffer
          local bufnr = vim.api.nvim_get_current_buf()
          local ok, err = pcall(function()
            require("ufo").enable(bufnr)
          end)
          if not ok then
            -- Fallback to treesitter folding if UFO fails
            vim.wo.foldmethod = 'expr'
            vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
          end
        end
      })
    end,
  }
}