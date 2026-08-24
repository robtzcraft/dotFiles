
-- SYM

-- Esc -> Escape
-- F1 -> XF86AudioMute              (Volume 0)
-- F2 -> XF86AudioLowerVolume       (Volume -)
-- F3 -> XF86AudioRaiseVolume       (Volume +)
-- F4 -> XF86AudioMicMute           (Mic 0)
-- F5 -> XF86MonBrightnessDown      (Bright -)
-- F6 -> XF86MonBrightnessUp        (Bright +)
-- F7 -> SUPER + P                  (Undefined - [ScreenSharing by default])
-- F8 -> XF86RFKill     (System management - Don't touch)
-- F9 -> SUPER + I                  (Undefined - [Settings])
-- F10 -> SUPER + L                 (Lock Session)
-- F11 -> SUPER + V                 (ToogleFloating)
-- F12 -> XF86Calculator            (Undefined - [Calculator])
-- Ins -> XF86Favorites             (Undefined - [Favorites])
-- ImpPt -> SUPER + SHIFT + S       (Screenshots)
-- Supr -> Delete

local appLauncher = 'hyprlauncher'
local terminalEmulator = 'kitty'

-- General
hl.bind( 'SUPER + E', hl.dsp.exec_cmd( appLauncher ), { description = 'Open app selector' } )
hl.bind( 'SUPER + W', hl.dsp.exec_cmd( terminalEmulator ), { description = 'Open default terminal' } )
hl.bind( 'SUPER + C', hl.dsp.window.close( hl.get_active_window( ) ) )
hl.bind( 'SUPER + V', hl.dsp.window.float( on, hl.get_active_window( ) ) )
hl.bind( 'SUPER + L', hl.dsp.exec_cmd( 'loginctl lock-session' ) )

-- Fn Keys
--- Audio
hl.bind( 'XF86AudioMute', hl.dsp.exec_cmd( 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle' ) )
hl.bind( 'XF86AudioLowerVolume', hl.dsp.exec_cmd( 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-' ) )
hl.bind( 'XF86AudioRaiseVolume', hl.dsp.exec_cmd( 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+' ) )

-- Brightness
hl.bind( 'XF86MonBrightnessDown', hl.dsp.exec_cmd( 'bash -c \'curr=$(brightnessctl get); new=$((curr*2/3)); brightnessctl set ${new}\'' ) )
hl.bind( 'XF86MonBrightnessUp', hl.dsp.exec_cmd( 'bash -c \'curr=$(brightnessctl get); new=$((curr*4/3)); brightnessctl set ${new}\'' ) )

-- To add
-- Turn off/on Mic ( Fn + F4 )
-- Screen Sharing ( Fn + F7 )
-- Plane Mode ( Fn + F8 )

-- Workspaces switching
hl.bind( 'SUPER + 1', hl.dsp.focus( { workspace = '1' } ) )
hl.bind( 'SUPER + 2', hl.dsp.focus( { workspace = '2' } ) )
hl.bind( 'SUPER + 3', hl.dsp.focus( { workspace = '3' } ) )
hl.bind( 'SUPER + 4', hl.dsp.focus( { workspace = '4' } ) )
hl.bind( 'SUPER + 5', hl.dsp.focus( { workspace = '5' } ) )

-- Mouse bindings
hl.gesture( { fingers = 3, direction = 'horizontal', action = 'workspace' } )
