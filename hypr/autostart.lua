-- ~/.config/hypr/autostart.lua

hl.on("hyprland.start", function()

    local startup = {
        "waybar",
        "hyprpaper",
        "systemctl --user start hyprpolkitagent",
        "hyprctl dispatch workspace 1",
        "hypridle"
      }

    for _, cmd in ipairs(startup) do
        hl.exec_cmd(cmd)
    end


end)
