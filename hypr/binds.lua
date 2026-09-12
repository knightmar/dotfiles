-- ~/.config/hypr/binds.lua

--------------------------------------------------
-- Helpers
--------------------------------------------------

local function bind(keys, dispatcher, opts)
    return hl.bind(MOD .. " + " .. keys, dispatcher, opts)
end

local function exec(keys, command)
    return bind(keys, hl.dsp.exec_cmd(command))
end

local function bind_locked(key, command, repeatable)
    return hl.bind(
        key,
        hl.dsp.exec_cmd(command),
        {
            locked = true,
            repeating = repeatable or false,
        }
    )
end

--------------------------------------------------
-- Applications
--------------------------------------------------

exec("RETURN", apps.terminal)
exec("E", apps.files)
exec("B", apps.browser)
exec("A", "wofi --show drun")
exec("L", apps.locker)

bind("SHIFT + Q", hl.dsp.window.close())
bind("T", hl.dsp.window.float({ action = "toggle" }))
bind("P", hl.dsp.window.pseudo())
bind("J", hl.dsp.layout("togglesplit"))

exec("SHIFT + R", "hyprctl reload")

--------------------------------------------------
-- Fullscreen
--------------------------------------------------

bind("F", hl.dsp.window.fullscreen(0))
bind("SHIFT + F", hl.dsp.window.fullscreen(1))

--------------------------------------------------
-- Focus
--------------------------------------------------

bind("left", hl.dsp.focus({ direction = "left" }))
bind("right", hl.dsp.focus({ direction = "right" }))
bind("up", hl.dsp.focus({ direction = "up" }))
bind("down", hl.dsp.focus({ direction = "down" }))

--------------------------------------------------
-- Workspaces (AZERTY)
--------------------------------------------------

local workspace_keys = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
}

for ws, key in ipairs(workspace_keys) do

    bind(key,
        hl.dsp.focus({
            workspace = ws,
        })
    )

    bind(
        "SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = ws,
        })
    )

end

--------------------------------------------------
-- Scratchpad
--------------------------------------------------

--bind(
--    "S",
--    hl.dsp.workspace.toggle_special("magic")
--)

--bind(
--   "SHIFT + S",
--    hl.dsp.window.move({
--       workspace = "special:magic",
--    })
--)

--------------------------------------------------
-- Mouse
--------------------------------------------------

bind(
    "mouse_down",
    hl.dsp.focus({
        workspace = "e+1",
    })
)

bind(
    "mouse_up",
    hl.dsp.focus({
        workspace = "e-1",
    })
)

hl.bind(
    MOD .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    MOD .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

--------------------------------------------------
-- Screenshots
--------------------------------------------------

hl.bind(
    MOD .. "+ SHIFT + S",
    hl.dsp.exec_cmd([[bash -c 'slurp | grim -g - - | wl-copy']])
)
--------------------------------------------------
-- Audio
--------------------------------------------------

bind_locked(
    "XF86AudioRaiseVolume",
    "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
    true
)

bind_locked(
    "XF86AudioLowerVolume",
    "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
    true
)

bind_locked(
    "XF86AudioMute",
    "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
    true
)

bind_locked(
    "XF86AudioMicMute",
    "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    true
)

--------------------------------------------------
-- Brightness
--------------------------------------------------

bind_locked(
    "XF86MonBrightnessUp",
    "brightnessctl -e4 -n2 set 5%+",
    true
)

bind_locked(
    "XF86MonBrightnessDown",
    "brightnessctl -e4 -n2 set 5%-",
    true
)

--------------------------------------------------
-- Media
--------------------------------------------------

bind_locked(
    "XF86AudioNext",
    "playerctl next"
)

bind_locked(
    "XF86AudioPrev",
    "playerctl previous"
)

bind_locked(
    "XF86AudioPlay",
    "playerctl play-pause"
)

bind_locked(
    "Pause",
    "playerctl play-pause"
)

bind_locked(
    "XF86AudioPause",
    "playerctl play-pause"
)
