data:extend({
  -- {
  --   type = "bool-setting",
  --   name = "enable-for-all-tiers",
  --   setting_type = "startup",
  --   default_value = false,
  -- },
  {
    type = "bool-setting",
    name = "disable-mod-recipes",
    setting_type = "startup",
    default_value = false,
  },
  {
    type = "double-setting",
    name = "robot-carry-size-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-speed-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-battery-size-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-energy-usage-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-energy-tick-usage-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "roboport-logistics-radius-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "roboport-construction-radius-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "int-setting",
    name = "roboport-logistics-radius-value",
    setting_type = "startup",
    default_value = -1
  },
  {
    type = "int-setting",
    name = "roboport-construction-radius-value",
    setting_type = "startup",
    default_value = -1
  },
  {
    type = "bool-setting",
    name = "only-modify-vanilla-roboport",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "double-setting",
    name = "roboport-charging-rate-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "roboport-buffer-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "roboport-energy-usage-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-stack-size",
    setting_type = "startup",
    default_value = 50
  },
  {
    type = "double-setting",
    name = "robot-health-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "bool-setting",
    name = "enable-early-construction-robots",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "enable-early-logistic-robots",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "enable-early-logistic-system",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "enable-quick-start",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "double-setting",
    name = "inserter-speed-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
})
