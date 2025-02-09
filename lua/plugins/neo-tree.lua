return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_by_name = {
                    -- add extension names you want to explicitly exclude
                    '.git',
                    '.DS_Store',
                    '.github',
                    -- 'thumbs.db',
                },
                never_show = {},
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
