hl.config({
    decoration = {
        rounding = 12,

        blur = {
            enabled           = true,
            xray              = false,
            special           = true,
            ignore_opacity    = true, -- Allows opacity blurring
            new_optimizations = true,
            popups            = true,
            input_methods     = true,
            size              = 8,
            passes            = 2,
        },

        shadow = {
            enabled      = true,
        },
    },
})
