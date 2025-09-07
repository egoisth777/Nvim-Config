-- Add this to your config
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex", "plaintex" },
    callback = function()
      local trace_file = vim.fn.getcwd() .. "/tex-clipboard-trace.txt"
      local count = 0
      
      -- Clear the file at start
      local f = io.open(trace_file, "w")
      if f then
        f:write("=== TeX Clipboard Access Trace ===\n")
        f:write("Started at: " .. os.date() .. "\n\n")
        f:close()
      end
      
      -- Override getreg for tex files only
      local original_getreg = vim.fn.getreg
      vim.fn.getreg = function(reg, ...)
        if reg == '+' or reg == '*' then
          count = count + 1
          
          -- Write first 10 traces to file to avoid huge files
          if count <= 10 then
            local trace = debug.traceback("Clipboard register '" .. reg .. "' accessed (call #" .. count .. ")", 2)
            local f = io.open(trace_file, "a")
            if f then
              f:write(trace .. "\n")
              f:write("=" .. string.rep("=", 50) .. "\n\n")
              f:close()
            end
          end
          
          -- Show notification for first 3
          if count <= 3 then
            vim.notify("Clipboard '" .. reg .. "' accessed (check " .. trace_file .. ")")
          elseif count == 11 then
            vim.notify("Stopped tracing after 10 calls. Check " .. trace_file)
          end
        end
        return original_getreg(reg, ...)
      end
      
      vim.notify("Clipboard tracing enabled. File: " .. trace_file)
    end,
  })