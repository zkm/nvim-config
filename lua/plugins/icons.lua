return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    default = true,
    strict = true,
    override_by_filename = {
      ["init.lua"] = {
        icon = "",
        color = "#57A143",
        name = "NeovimConfig",
      },
      [".env"] = {
        icon = "󰒓",
        color = "#F9E2AF",
        name = "Dotenv",
      },
      [".env.example"] = {
        icon = "󰒓",
        color = "#F9E2AF",
        name = "DotenvExample",
      },
      [".gitignore"] = {
        icon = "",
        color = "#E84D31",
        name = "GitIgnore",
      },
      ["docker-compose.yml"] = {
        icon = "󰡨",
        color = "#2496ED",
        name = "DockerCompose",
      },
      ["docker-compose.yaml"] = {
        icon = "󰡨",
        color = "#2496ED",
        name = "DockerCompose",
      },
      ["lazy-lock.json"] = {
        icon = "󰒓",
        color = "#EADBA7",
        name = "LazyLock",
      },
    },
    override_by_extension = {
      lock = {
        icon = "󰌾",
        color = "#EADBA7",
        name = "Lock",
      },
      conf = {
        icon = "",
        color = "#6D8086",
        name = "Conf",
      },
      tmux = {
        icon = "",
        color = "#89E051",
        name = "Tmux",
      },
    },
  },
}
