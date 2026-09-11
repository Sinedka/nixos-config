local vars = require("variables")

hl.config({
  general = {
    layout        = "master",

    allow_tearing = false,       -- Allows `immediate` window rule to work

    resize_on_border = false,
    extend_border_grab_area = 15,
    hover_icon_on_border = true,

    float_gaps = 0,

    gaps_in          = 4,
    gaps_out         = 6,
    border_size      = 3,
    gaps_workspaces  = 0,

    col              = {
      active_border   = "rgba(c2c1ffe6)",
      inactive_border = "rgba(c8c5d111)",
    },
  },

  scrolling = {
    fullscreen_on_one_column = true,
    focus_fit_method         = 1,
    column_width             = 0.5,
    follow_focus             = true,
    follow_min_visible       = 0.0,
    explicit_column_widths   = "0.35, 0.5, 0.65, 1.0",
  },
})
