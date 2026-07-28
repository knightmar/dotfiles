-- ~/.config/hypr/autostart.lua

hl.on("hyprland.start", function()

    local startup = {

        "waybar",
        "hyprpaper",

        "systemctl --user start elephant.service",

        "awww-daemon",

        "walker --gapplication-service",

    }

    for _, cmd in ipairs(startup) do
        hl.exec_cmd(cmd)
    end

end)
