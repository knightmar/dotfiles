-- ~/.config/hypr/config.lua

--------------------------------------------------
-- Applications
--------------------------------------------------

apps = {
    terminal = "kitty",
    files = "dolphin",
    browser = "zen-browser",
    launcher = "walker",
    locker = "hyprlock",
}

--------------------------------------------------
-- Modifier
--------------------------------------------------

MOD = "SUPER"

--------------------------------------------------
-- Monitor
--------------------------------------------------

hl.monitor({
    output = "DP-2",
    mode = "preferred",
    position = "auto-up", 
    scale = 1,
})


hl.monitor({
    output = "",
    mode = "preferred",
    position = "0x0",
    scale = 1.25,
})


--------------------------------------------------
-- Environment
--------------------------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--------------------------------------------------
-- Configuration
--------------------------------------------------

hl.config({

    general = {

        gaps_in = 3,
        gaps_out = 5,

        border_size = 2,

        resize_on_border = true,
        allow_tearing = false,

        layout = "dwindle",
    },

    input = {

        kb_layout = "fr,kr",
        kb_options = "",
        numlock_by_default = true, 
        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },
    },

    decoration = {},

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },

    xwayland = {
        force_zero_scaling = true,
    },

})

--------------------------------------------------
-- Workspaces
--------------------------------------------------

hl.workspace_rule({ 
  workspace = "1",
  monitor = "DP-2",
  default = true
})



--------------------------------------------------
-- Gestures
--------------------------------------------------

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

--------------------------------------------------
-- Devices
--------------------------------------------------

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
