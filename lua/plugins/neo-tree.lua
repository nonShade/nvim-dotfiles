return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
            },
        },
        window = { position = "right" },
        event_handlers = {
            {
                event = "file_opened",
                handler = function()
                    -- Close Neo-tree when a file is opened
                    require("neo-tree").close_all()
                end,
            },
        },
    },
}
