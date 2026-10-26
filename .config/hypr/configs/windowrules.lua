
local defaultWinSize = { 1312, 812 }

function onOpen( className, initialTitle, winSize )
    windowSize = winSize or defaultWinSize
    if className then
        hl.window_rule( {
            name = 'On open: ' .. className,
            match = { class = className },
            float = true,
            size = { windowSize[ 1 ], windowSize[ 2 ] },
            -- center = true
        } )
    end
    if initialTitle then
        hl.window_rule( {
            name = "On Open: " .. initialTitle .. ".",
            match = { initial_title = initialTitle },
            float = true,
            size = { windowSize[1], windowSize[2] },
            -- center = true,
        } )
    end
end

hl.window_rule( {
    name = 'General Defaults',
    match = { class = '^.*' },
    float = true,
    center = true,
} )

onOpen( nil , 'Mozilla Firefox' )
onOpen( nil , 'Firefox Developer Edition' )
onOpen( 'obsidian', nil )
onOpen( 'discord', nil )
onOpen( nil, 'kitty' )
onOpen( nil, 'Visual Studio Code' )
onOpen( 'google-chrome', '' )

hl.window_rule({
    name  = "Quickshell Configurations",
    match = {
        class = "org.quickshell",
        title = "Quickshell Configurations",
    },
    max_size = { 900, 600 },
    float = true,
    center = true,
})

hl.window_rule( {
    name = 'KiCad',
    match = { initial_class = 'KiCad' },
    float = true,
    center = true,
    rounding = 0,
} )
