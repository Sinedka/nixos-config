local vars = require("variables")
local fn   = require("hyprland.functions")
local mainMod = _G.mainMod or "SUPER"
local terminal = _G.terminal or "kitty"


hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("serpantinum brightness lower"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("serpantinum brightness raise"), { locked = true })

hl.bind("Print", hl.dsp.exec_cmd("serpantinum screenshot"), { locked = true })
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("serpantinum screenshot --edit"), { locked = true })
hl.bind("SUPER + Print", hl.dsp.exec_cmd("serpantinum screenshot --full"), { locked = true })
hl.bind("SUPER + SHIFT + Print", hl.dsp.exec_cmd("serpantinum screenshot --full --edit"), { locked = true })


hl.bind("XF86PowerOff", hl.dsp.exec_cmd("serpantinum lock"), { locked = true })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("serpantinum lock"), { repeating = true, locked = true })


hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("serpantinum volume mic-toggle"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("serpantinum volume mute-toggle"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("serpantinum volume lower"), { repeating = true, locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("serpantinum volume raise"), { repeating = true, locked = true })


hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("serpantinum reload"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("serpantinum msg toggle clipboard"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("serpantinum msg toggle launcher"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("serpantinum msg toggle music"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("serpantinum msg toggle system"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("serpantinum msg toggle wallpaper"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("serpantinum msg toggle calendar"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("serpantinum msg toggle network"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("serpantinum msg toggle volume"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("serpantinum msg toggle guide"))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(vars.kbGoToWs .. " + " .. key, fn.wsaction("focus", "", i))
    hl.bind(vars.kbMoveWinToWs .. " + " .. key, fn.wsaction("move", "", i))
    hl.bind(vars.kbGoToWsGroup .. " + " .. key, fn.wsaction("focus", "group", i))
    hl.bind(vars.kbMoveWinToWsGroup .. " + " .. key, fn.wsaction("move", "group", i))
end

-- Go to workspace -1/+1
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "+1" }))
hl.bind("CTRL + SUPER + Left", hl.dsp.focus({ workspace = "-1" }), { repeating = true })
hl.bind("CTRL + SUPER + Right", hl.dsp.focus({ workspace = "+1" }), { repeating = true })
hl.bind("SUPER + Page_Up", hl.dsp.focus({ workspace = "-1" }), { repeating = true })
hl.bind("SUPER + Page_down", hl.dsp.focus({ workspace = "+1" }), { repeating = true })

-- Go to workspace group -1/+1
hl.bind("CTRL + SUPER + mouse_down", hl.dsp.focus({ workspace = "-10" }))
hl.bind("CTRL + SUPER + mouse_up", hl.dsp.focus({ workspace = "+10" }))

-- Move window to workspace -1/+1
hl.bind("SUPER + ALT + Page_Up", hl.dsp.window.move({ workspace = "-1" }), { repeating = true })
hl.bind("SUPER + ALT + Page_Down", hl.dsp.window.move({ workspace = "+1" }), { repeating = true })
hl.bind("SUPER + ALT + mouse_down", hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + ALT + mouse_up", hl.dsp.window.move({ workspace = "+1" }))
hl.bind("CTRL + SUPER + SHIFT + right", hl.dsp.window.move({ workspace = "+1" }), { repeating = true })
hl.bind("CTRL + SUPER + SHIFT + left", hl.dsp.window.move({ workspace = "-1" }), { repeating = true })

-- Move window to/from special workspace
hl.bind("CTRL + SUPER + SHIFT + up", hl.dsp.window.move({ workspace = "special:special" }))
hl.bind("CTRL + SUPER + SHIFT + down", hl.dsp.window.move({ workspace = "e+0" }))
hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:special" }))

-- Window groups
hl.bind("ALT + TAB", hl.dsp.window.cycle_next(), { repeating = true })
hl.bind("SHIFT + ALT + TAB", hl.dsp.window.cycle_next({ next = false }), { repeating = true })
hl.bind("CTRL + ALT + Tab", hl.dsp.group.next(), { repeating = true })
hl.bind("CTRL + SHIFT + ALT + Tab", hl.dsp.group.prev(), { repeating = true })
hl.bind("SUPER + Comma", hl.dsp.group.toggle())
hl.bind("SUPER + U", hl.dsp.window.move({ out_of_group = true }))
hl.bind("SUPER + SHIFT + Comma", hl.dsp.group.lock_active())

-- Window actions
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + Minus", hl.dsp.window.resize(fn.resize_active_window(-10, 0)), { repeating = true })
hl.bind("SUPER + Equal", hl.dsp.window.resize(fn.resize_active_window(10, 0)), { repeating = true })
hl.bind("SUPER + SHIFT + Minus", hl.dsp.window.resize(fn.resize_active_window(0, -10)), { repeating = true })
hl.bind("SUPER + SHIFT + Equal", hl.dsp.window.resize(fn.resize_active_window(0, 10)), { repeating = true })
hl.bind("SUPER + ALT + left", hl.dsp.window.resize(fn.resize_active_window(-10, 0)), { repeating = true })
hl.bind("SUPER + ALT + right", hl.dsp.window.resize(fn.resize_active_window(10, 0)), { repeating = true })
hl.bind("SUPER + ALT + up", hl.dsp.window.resize(fn.resize_active_window(0, -10)), { repeating = true })
hl.bind("SUPER + ALT + down", hl.dsp.window.resize(fn.resize_active_window(0, 10)), { repeating = true })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(vars.kbMoveWindow, hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(vars.kbResizeWindow, hl.dsp.window.resize(), { mouse = true })
hl.bind("CTRL + SUPER + Backslash", hl.dsp.window.center())
hl.bind("CTRL + SUPER + ALT + Backslash", hl.dsp.window.resize(fn.resize_by_screen(55, 70)))
hl.bind("CTRL + SUPER + ALT + Backslash", hl.dsp.window.center())
hl.bind(vars.kbWindowPip, function()
    local a = hl.get_active_window()
    if a then
        local pip = fn.move_actions(a) or {}
        if not a.floating then table.insert(pip, 1, hl.dsp.window.float()) end
        table.insert(pip, hl.dsp.window.pin({ action = "on", window = "address:" .. a.address }))

        for _, x in ipairs(pip) do
            hl.dispatch(x)
        end
    end
end)
hl.bind(vars.kbPinWindow, hl.dsp.window.pin())
hl.bind(vars.kbWindowFullscreen, hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(vars.kbWindowBorderedFullscreen, hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(vars.kbToggleWindowFloating, hl.dsp.window.float())
hl.bind(vars.kbCloseWindow, hl.dsp.window.close())

-- Special workspace toggles
hl.bind(vars.kbSpecialWs, hl.dsp.exec_cmd("caelestia toggle specialws"))
hl.bind(vars.kbSystemMonitorWs, hl.dsp.exec_cmd("caelestia toggle sysmon"))
hl.bind(vars.kbMusicWs, hl.dsp.exec_cmd("caelestia toggle music"))
hl.bind(vars.kbCommunicationWs, hl.dsp.exec_cmd("caelestia toggle communication"))
hl.bind(vars.kbTodoWs, hl.dsp.exec_cmd("caelestia toggle notes"))

-- Apps
hl.bind(vars.kbTerminal, hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.kbBrowser, hl.dsp.exec_cmd(vars.browser))
hl.bind(vars.kbEditor, hl.dsp.exec_cmd(vars.editor))
hl.bind(vars.kbFileExplorer, hl.dsp.exec_cmd(vars.fileExplorer))
hl.bind("CTRL + ALT + V", hl.dsp.exec_cmd(vars.audioSettings))

-- Utilities
hl.bind("Print", hl.dsp.exec_cmd("caelestia screenshot"), { locked = true })
hl.bind("SUPER + SHIFT + S", hl.dsp.global("caelestia:screenshotFreeze"))
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.global("caelestia:screenshot"))
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("caelestia record -s"))
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("caelestia record"))
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("caelestia record -r"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

-- Volume
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("SUPER + ALT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l " ..
        (vars.volumeMax / 100) .. " @DEFAULT_AUDIO_SINK@ " .. vars.volumeStep .. "%+"
    ),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. vars.volumeStep .. "%-"
    ),
    { locked = true, repeating = true }
)

-- Sleep
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd(vars.sleepGestureCmd), { locked = true })

-- Clipboard and emoji picker
hl.bind("SUPER + V", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"))
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard -d"))
hl.bind("SUPER + Period", hl.dsp.exec_cmd("pkill fuzzel || caelestia emoji -p"))
hl.bind(
    "CTRL + SHIFT + ALT + V",
    hl.dsp.exec_cmd('sleep 0.5s && ydotool type -d 1 "$(cliphist list | head -1 | cliphist decode)"'),
    { locked = true }
)

-- Testing
hl.bind(
    "SUPER + ALT + F12",
    hl.dsp.exec_cmd(
        "notify-send -u low -i dialog-information-symbolic 'Test notification' " ..
        [["Here's a really long message to test truncation and wrapping\nYou can middle click or flick this notification to dismiss it!"]] ..
        " -a 'Shell' -A 'Test1=I got it!' -A 'Test2=Another action'"
    )
)
