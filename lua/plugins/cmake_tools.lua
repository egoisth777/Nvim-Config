return {
    "Civitasv/cmake-tools.nvim",
    opts = {
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" },
        cmake_build_directory = function()
            if vim.fn.has("win32") == 1 then
                return "nvim-cmake-build\\${variant:buildType}"
            end
            return "nvim-cmake-build/${variant:buildType}"
        end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a strings}
    },
}
