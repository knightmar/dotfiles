-- ~/.config/hypr/theme.lua

--------------------------------------------------
-- Colors
--------------------------------------------------

theme = {
    base      = "rgb(15173d)",
    accent    = "rgb(982598)",
    lowlight  = "rgb(e491c9)",
    text      = "rgb(f1e9e9)",

    shadow    = "rgba(1a1a1aee)",
}

--------------------------------------------------
-- Look & Feel
--------------------------------------------------

hl.config({

    general = {
        col = {
            active_border = {
                colors = {
                    theme.accent,
                    theme.lowlight,
                },
                angle = 45,
            },

            inactive_border = theme.base,
        },
    },

    decoration = {

        rounding = 3,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 0.7,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = theme.shadow,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

})

--------------------------------------------------
-- Curves
--------------------------------------------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        {0.23, 1},
        {0.32, 1},
    },
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        {0.65, 0.05},
        {0.36, 1},
    },
})

hl.curve("linear", {
    type = "bezier",
    points = {
        {0, 0},
        {1, 1},
    },
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        {0.5, 0.5},
        {0.75, 1},
    },
})

hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0},
        {0.10, 1},
    },
})

--------------------------------------------------
-- Spring
--------------------------------------------------

hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 238.1191,
    dampening = 24.21279333,
})

--------------------------------------------------
-- Animations
--------------------------------------------------

local animations = {

    { "global",        true, 10,   "default" },
    { "border",        true, 5.39, "easeOutQuint" },

    { "windows",       true, 4.79, "easy",          nil, true },
    { "windowsIn",     true, 4.10, "easy", "popin 87%", true },

    { "windowsOut",    true, 1.49, "linear", "popin 87%" },

    { "fadeIn",        true, 1.73, "almostLinear" },
    { "fadeOut",       true, 1.46, "almostLinear" },
    { "fade",          true, 3.03, "quick" },

    { "layers",        true, 3.81, "easeOutQuint" },
    { "layersIn",      true, 4.00, "easeOutQuint", "fade" },
    { "layersOut",     true, 1.50, "linear", "fade" },

    { "fadeLayersIn",  true, 1.79, "almostLinear" },
    { "fadeLayersOut", true, 1.39, "almostLinear" },

    { "workspaces",    true, 1.94, "almostLinear", "fade" },
    { "workspacesIn",  true, 1.21, "almostLinear", "fade" },
    { "workspacesOut", true, 1.94, "almostLinear", "fade" },

    { "zoomFactor",    true, 7.00, "quick" },

}

for _, a in ipairs(animations) do

    local cfg = {
        leaf = a[1],
        enabled = a[2],
        speed = a[3],
    }

    if a[6] then
        cfg.spring = a[4]
    else
        cfg.bezier = a[4]
    end

    if a[5] then
        cfg.style = a[5]
    end

    hl.animation(cfg)

end
