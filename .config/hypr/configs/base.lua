
-- Necessary changes
--      Change cursor size to 22px
--






-- Monitor config
hl.monitor( {
    output = "eDP-1",
    mode = "highres@60",
    position = "auto",
    scale = 1.6
} )

hl.on( "hyprland.start", function( )
    hl.exec_cmd( "systemctl --user start hyprpolkitagent" )
    hl.exec_cmd( "hyprpaper &" )
    hl.exec_cmd( "sleep 0.1 && sh $HOME/Documents/dotFiles/scripts/wallpaperHandler.sh" )
    hl.exec_cmd( "quickshell" )
    hl.exec_cmd( "hypridle" )
end )



hl.config( {

    --- Syntax
    --- category = {
    ---     value = ...
    --- },
    --- category2 = {
    ---     value = ...
    --- }

    -- Check: https://wiki.hypr.land/Configuring/Basics/Variables

    general = {
        border_size = 0,
        gaps_in = 6,
        gaps_out = 12,
        layout = "dwindle",
        resize_on_border = true
    },

    decoration = {
        rounding = 16,
        blur = {
            enabled = true,
            new_optimizations = true
        },
        shadow = {
            range = 80,
            color = "rgba(00000043)",
            color_inactive = "rgba(00000030)",
        } 
    },

    animations = {
        enabled = true
    },
    input = {
        kb_layout = "latam",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true
        }
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    },
    xwayland = {
        force_zero_scaling = false
    }

} )

