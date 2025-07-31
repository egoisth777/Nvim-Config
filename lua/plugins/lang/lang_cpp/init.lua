-- C++ Language Configuration
-- This file loads all C++-related plugins from subdirectories

return {
    -- Import CMake-specific configurations
    { import = "plugins.lang.lang_cpp.cmake" },
    -- Import C++-specific configurations  
    { import = "plugins.lang.lang_cpp.cpp" },
}