-- setting up some trouble notifications
-- All Troubles will be displayed at the bottom of the screen
return
{
    "folke/trouble.nvim",
    opts = {
        position = "bottom", -- Move the window to bottom of the screen
        height = 10,
        width = 60,
    }
}