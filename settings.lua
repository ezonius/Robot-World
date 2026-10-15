data:extend({
  -- {
  --   type = "bool-setting",
  --   name = "enable-for-all-tiers",
  --   setting_type = "startup",
  --   default_value = false,
  -- },

  -- === Robot ===
  {
    type = "double-setting",
    name = "robot-carry-size-multiplier",
    order = "a[robot]-a[carry-size-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-speed-multiplier",
    order = "a[robot]-b[speed-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-battery-size-multiplier",
    order = "a[robot]-c[battery-size-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-energy-usage-multiplier",
    order = "a[robot]-d[energy-usage-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-energy-tick-usage-multiplier",
    order = "a[robot]-e[energy-tick-usage-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "robot-stack-size",
    order = "a[robot]-f[stack-size]",
    setting_type = "startup",
    default_value = 50
  },
  {
    type = "double-setting",
    name = "robot-health-multiplier",
    order = "a[robot]-g[health-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },

  -- === Construction robot ===
  {
    type = "double-setting",
    name = "construction-robot-carry-size-multiplier",
    order = "b[construction-robot]-a[carry-size-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "construction-robot-speed-multiplier",
    order = "b[construction-robot]-b[speed-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "construction-robot-battery-size-multiplier",
    order = "b[construction-robot]-c[battery-size-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "construction-robot-energy-usage-multiplier",
    order = "b[construction-robot]-d[energy-usage-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "construction-robot-energy-tick-usage-multiplier",
    order = "b[construction-robot]-e[energy-tick-usage-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },

  -- === Logistics robot ===
  {
    type = "double-setting",
    name = "logistics-robot-carry-size-multiplier",
    order = "c[logistics-robot]-a[carry-size-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "logistics-robot-speed-multiplier",
    order = "c[logistics-robot]-b[speed-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "logistics-robot-battery-size-multiplier",
    order = "c[logistics-robot]-c[battery-size-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "logistics-robot-energy-usage-multiplier",
    order = "c[logistics-robot]-d[energy-usage-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "logistics-robot-energy-tick-usage-multiplier",
    order = "c[logistics-robot]-e[energy-tick-usage-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },

  -- === Roboport ===
  {
    type = "double-setting",
    name = "roboport-logistics-radius-multiplier",
    order = "d[roboport]-a[logistics-radius-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "roboport-construction-radius-multiplier",
    order = "d[roboport]-b[construction-radius-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "int-setting",
    name = "roboport-logistics-radius-value",
    order = "d[roboport]-c[logistics-radius-value]",
    setting_type = "startup",
    default_value = -1,
    minimum_value = -1,
  },
  {
    type = "int-setting",
    name = "roboport-construction-radius-value",
    order = "d[roboport]-d[construction-radius-value]",
    setting_type = "startup",
    default_value = -1,
    minimum_value = -1,
  },
  {
    type = "double-setting",
    name = "roboport-charging-rate-multiplier",
    order = "d[roboport]-e[charging-rate-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "roboport-buffer-multiplier",
    order = "d[roboport]-f[buffer-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "double-setting",
    name = "roboport-energy-usage-multiplier",
    order = "d[roboport]-g[energy-usage-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "bool-setting",
    name = "only-modify-vanilla-roboport",
    order = "d[roboport]-h[only-modify-vanilla-roboport]",
    setting_type = "startup",
    default_value = false
  },

  -- === Enable early ===
  {
    type = "bool-setting",
    name = "enable-early-construction-robots",
    order = "e[early]-a[construction-robots]",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "enable-early-logistic-robots",
    order = "e[early]-b[logistic-robots]",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "enable-early-logistic-system",
    order = "e[early]-c[logistic-system]",
    setting_type = "startup",
    default_value = false
  },

  -- === Extra research ===
  {
    type = "bool-setting",
    name = "enable-extra-robot-speed-research",
    order = "f[extra-speed-research]-a[enable]",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "int-setting",
    name = "extra-robot-speed-research-count",
    order = "f[extra-speed-research]-b[count]",
    setting_type = "startup",
    default_value = 5,
    minimum_value = 1,
    maximum_value = 50
  },
  {
    type = "bool-setting",
    name = "enable-extra-robot-storage-research",
    order = "g[extra-cargo-research]-a[enable]",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "int-setting",
    name = "extra-robot-storage-research-count",
    order = "g[extra-cargo-research]-b[count]",
    setting_type = "startup",
    default_value = 5,
    minimum_value = 1,
    maximum_value = 50
  },

  -- === Misc ===
  {
    type = "double-setting",
    name = "inserter-speed-multiplier",
    order = "h[misc]-a[inserter-speed-multiplier]",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
  },
  {
    type = "bool-setting",
    name = "enable-quick-start",
    order = "h[misc]-b[enable-quick-start]",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "disable-mod-recipes",
    order = "h[misc]-c[disable-mod-recipes]",
    setting_type = "startup",
    default_value = false,
  },

  -- === Invisible robots ===
  {
    type = "bool-setting",
    name = "invisible-construction-robots",
    order = "i[invisible-robots]-a[construction-robots]",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "invisible-logistic-robots",
    order = "i[invisible-robots]-b[logistic-robots]",
    setting_type = "startup",
    default_value = false
  },

  -- === Non-lootable robots ===
  {
    type = "bool-setting",
    name = "non-lootable-construction-robots",
    order = "j[non-lootable]-a[construction-robots]",
    setting_type = "runtime-global",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "non-lootable-logistic-robots",
    order = "j[non-lootable]-b[logistic-robots]",
    setting_type = "runtime-global",
    default_value = false
  },
})