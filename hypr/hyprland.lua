-- ~/.config/hypr/hyprland.lua

require("config")
require("theme")
require("autostart")
require("binds")
require("rules")

hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("HYPRCURSOR_THEME","rose-pine-hyprcursor");
