local active_border_color = { colors = { "rgba(e23a2bee)", "rgba(e8b86dee)" }, angle = 45 }
local inactive_border_color = "rgba(7a5344aa)"
local active_shadow_color = "rgba(e23a2b77)"
local inactive_shadow_color = "rgba(3d241c77)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 4,
    shadow = {
      enabled = true,
      range = 8,
      render_power = 3,
      color = active_shadow_color,
      color_inactive = inactive_shadow_color,
    },
  },
})
