data.raw["logistic-robot"]["logistic-robot"].max_energy = 2000 * settings.startup["robot-battery-size-multiplier"].value .. "kJ"
data.raw["logistic-robot"]["logistic-robot"].energy_per_move = 5 * settings.startup["robot-energy-usage-multiplier"].value .. "kJ"
data.raw["logistic-robot"]["logistic-robot"].energy_per_tick = "0kW"
data.raw["logistic-robot"]["logistic-robot"].max_payload_size = data.raw["logistic-robot"]["logistic-robot"].max_payload_size * settings.startup["robot-carry-size-multiplier"].value
data.raw["logistic-robot"]["logistic-robot"].speed = data.raw["logistic-robot"]["logistic-robot"].speed * settings.startup["robot-speed-multiplier"].value
data.raw["logistic-robot"]["logistic-robot"].max_health = data.raw["logistic-robot"]["logistic-robot"].max_health * settings.startup["robot-health-multiplier"].value

data.raw["construction-robot"]["construction-robot"].max_energy = 2000 * settings.startup["robot-battery-size-multiplier"].value .. "kJ"
data.raw["construction-robot"]["construction-robot"].energy_per_move = 5 * settings.startup["robot-energy-usage-multiplier"].value .. "kJ"
data.raw["construction-robot"]["construction-robot"].energy_per_tick = "0kW"
data.raw["construction-robot"]["construction-robot"].max_payload_size = data.raw["construction-robot"]["construction-robot"].max_payload_size * settings.startup["robot-carry-size-multiplier"].value
data.raw["construction-robot"]["construction-robot"].speed = data.raw["construction-robot"]["construction-robot"].speed* settings.startup["robot-speed-multiplier"].value
data.raw["construction-robot"]["construction-robot"].max_health = data.raw["construction-robot"]["construction-robot"].max_health * settings.startup["robot-health-multiplier"].value

data.raw["roboport"]["roboport"].energy_source.buffer_capacity = "1MJ"
data.raw["roboport"]["roboport"].energy_source.input_flow_limit = 5 * settings.startup["roboport-charging-rate-multiplier"].value .. "MW"
data.raw["roboport"]["roboport"].charging_energy = 1 * settings.startup["roboport-charging-rate-multiplier"].value .. "MW"
data.raw["roboport"]["roboport"].energy_usage = "0kW"
data.raw["roboport"]["roboport"].logistics_radius = data.raw["roboport"]["roboport"].logistics_radius * settings.startup["roboport-logistics-radius-multiplier"].value
data.raw["roboport"]["roboport"].construction_radius = data.raw["roboport"]["roboport"].construction_radius * settings.startup["roboport-construction-radius-multiplier"].value



for i, v in pairs(data.raw["inserter"]) do
v.extension_speed = v.extension_speed * settings.startup["inserter-speed-multiplier"].value
v.rotation_speed = v.rotation_speed * settings.startup["inserter-speed-multiplier"].value
end