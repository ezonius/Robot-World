-- Allows logistic robots, construction robots, and roboports to be configured

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

-- Allows inserters to be configured

for i, v in pairs(data.raw["inserter"]) do
v.extension_speed = v.extension_speed * settings.startup["inserter-speed-multiplier"].value
v.rotation_speed = v.rotation_speed * settings.startup["inserter-speed-multiplier"].value
end

-- Allows robot stack size to be configured

data.raw["item"]["logistic-robot"].stack_size = settings.startup["robot-stack-size"].value
data.raw["item"]["construction-robot"].stack_size = settings.startup["robot-stack-size"].value

-- Enables recipes based on settings

if (settings.startup["enable-early-logistic-robots"].value) then
for i, v in pairs(data.raw["technology"]["logistic-robotics"]["effects"]) do
data.raw["recipe"][v.recipe].enabled = true
end
end
if (settings.startup["enable-early-construction-robots"].value) then -- Using "for" doesn't work here, unfortunately
data.raw["recipe"]["roboport"].enabled = true
data.raw["recipe"]["construction-robot"].enabled = true
data.raw["recipe"]["logistic-chest-passive-provider"].enabled = true
data.raw["recipe"]["logistic-chest-storage"].enabled = true
end
if mods["recursive-blueprints"] then
data.raw["recipe"]["blueprint-deployer"].enabled = true
data.raw["recipe"]["blueprint-deployer"].ingredients = {
      {"iron-chest", 3},
      {"electronic-circuit", 1}
}
for i, v in pairs(data.raw["technology"]["circuit-network"]["effects"]) do
data.raw["recipe"][v.recipe].enabled = true
end
end
if (settings.startup["enable-early-logistic-system"].value) then
for i, v in pairs(data.raw["technology"]["logistic-system"]["effects"]) do
data.raw["recipe"][v.recipe].enabled = true
end
end

-- Changes cost of recipes

if (settings.startup["enable-early-logistic-robots"].value) then
data.raw["recipe"]["logistic-robot"].ingredients = 
{
    {"iron-plate", 1},
    {"iron-gear-wheel", 1},
    {"electronic-circuit", 1},
}
end

if (settings.startup["enable-early-construction-robots"].value) then            
data.raw["recipe"]["construction-robot"].ingredients = 
{
    {"iron-plate", 1},
    {"iron-gear-wheel", 1},
    {"electronic-circuit", 1},
}
end
if (settings.startup["enable-early-logistic-system"].value) then
      for i, v in pairs(data.raw["technology"]["logistic-system"]["effects"]) do
            data.raw["recipe"][v.recipe].ingredients = 
            {
                  {"iron-plate", 3},
                  {"electronic-circuit", 1},
            }
      end
end
if (settings.startup["enable-early-construction-robots"].value or settings.startup["enable-early-logistic-robots"].value) then
data.raw["recipe"]["roboport"].ingredients = 
{
  {"iron-plate", 25},
  {"iron-gear-wheel", 10},
  {"electronic-circuit", 10}
}
end

-- Makes electronic-circuits into basic-circuit-boards if bobelectronics is enabled

if mods["bobelectronics"] then
      for i, v in pairs(data.raw["technology"]["logistic-system"]["effects"]) do
            if data.raw["recipe"][v.recipe]["ingredients"].name == "electronic-circuit" then
                  data.raw["recipe"][v.recipe]["ingredients"].name = "basic-circuit-board"
            end
      end
      for i, v in pairs(data.raw["technology"]["logistic-robotics"]["effects"]) do
            if data.raw["recipe"][v.recipe]["ingredients"].name == "electronic-circuit" then
                  data.raw["recipe"][v.recipe]["ingredients"].name = "basic-circuit-board"
            end
      end
      for i, v in pairs(data.raw["technology"]["construction-robotics"]["effects"]) do
            if data.raw["recipe"][v.recipe]["ingredients"].name == "electronic-circuit" then
                  data.raw["recipe"][v.recipe]["ingredients"].name = "basic-circuit-board"
            end
      end
end

-- Support for LogisticMine, enabling early logistic mining drills

if mods["LogisticMine"] then
      for i, v in pairs(data.raw["technology"]["logistic-mining-drill"]["effects"]) do
            data.raw["recipe"][v.recipe].enabled = true
      end
      data.raw["technology"]["logistic-mining-drill"].hidden = true -- Hiding as the tech is no longer necessary
      data.raw["recipe"]["logistic-mining-drill"].ingredients = 
      {
            {"electric-mining-drill", 1},
            {"logistic-chest-active-provider"}
      }
      data.raw["recipe"]["logistic-mining-drill-2"].ingredients = 
      {
            {"electric-mining-drill", 1},
            {"logistic-chest-passive-provider"}
      }
end

-- Support for LogisticAssemblingMachine, enabling early logistic assembling machines

if mods["LogisticAssemblingMachine"] then
      for i, v in pairs(data.raw["technology"]["logistic-assembling-machine"]["effects"]) do
            data.raw["recipe"][v.recipe].enabled = true
      end
      data.raw["technology"]["logistic-assembling-machine"].hidden = true -- Hiding as the tech is no longer necessary
      data.raw["recipe"]["logistic-assembling-machine"].ingredients = 
      {
            {"assembling-machine-1", 2},
            {"inserter", 2},
            {"logistic-chest-passive-provider", 1},
            {"logistic-chest-requester", 1},
      }
end

-- Support for LogisticCargoWagon, enabling early logistic cargo wagons

if mods["logistic-cargo-wagon"] then
      table.insert(data.raw["technology"]["railway"].effects,  {type = "unlock-recipe", recipe = "logistic-cargo-wagon"})
      data.raw["technology"]["logistic-cargo-wagon"].hidden = true
end

-- Adds some new technologies if early robot settings are enabled

if (settings.startup["enable-early-construction-robots"].value or settings.startup["enable-early-logistic-robots"].value) then
data.raw.technology["worker-robots-storage-1"].prerequisites = {"early-worker-robots-storage"}
data.raw.technology["worker-robots-speed-1"].prerequisites = {"early-worker-robots-speed"}

data:extend({
{
    type = "technology",
    name = "early-character-logistic-slots",
    icon_size = 128,
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 6
      },
	  
    },
    prerequisites = {"logistics"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 15
    },
    order = "c-k-d",
  },


{
    type = "technology",
    name = "early-character-logistic-trash-slots",
    icon_size = 128,
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-trash-slots",
        modifier = 6
      }, 
    },
    prerequisites = {"logistics"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 15
    },
    order = "c-k-d",
  },


{
    type = "technology",
    name = "early-worker-robots-speed",
    icon_size = 128,
    icon = "__base__/graphics/technology/worker-robots-speed.png",
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.3
      },
	  
    },
    prerequisites = {"robotics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30
    },
    order = "c-k-d",
  },


{
    type = "technology",
    name = "early-worker-robots-storage",
    icon_size = 128,
    icon = "__base__/graphics/technology/worker-robots-storage.png",
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }, 
    },
    prerequisites = {"robotics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30
    },
    order = "c-k-d",
  },


})

end

