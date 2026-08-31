-- ~/.config/hypr/autostart.lua

hl.on("hyprland.start", function()

    local startup = {

        "waybar",
        "hyprpaper",
        "awww-daemon",
        "walker --gapplication-service",
        "elephant",
        "systemctl --user start hyprpolkitagent",
        "hyprctl dispatch workspace 1"
      }

    for _, cmd in ipairs(startup) do
        hl.exec_cmd(cmd)
    end


end)
