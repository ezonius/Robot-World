-- Allows logistic robots, construction robots, and roboports to be configured

data.raw["logistic-robot"]["logistic-robot"].max_energy = 2000 * settings.startup["robot-battery-size-multiplier"].value .. "kJ"
data.raw["logistic-robot"]["logistic-robot"].energy_per_move = 5 * settings.startup["robot-energy-usage-multiplier"].value .. "kJ"
data.raw["logistic-robot"]["logistic-robot"].energy_per_tick = "0kW"
data.raw["logistic-robot"]["logistic-robot"].max_payload_size = data.raw["logistic-robot"]["logistic-robot"].max_payload_size * settings.startup["robot-carry-size-multiplier"].value
data.raw["logistic-robot"]["logistic-robot"].speed = data.raw["logistic-robot"]["logistic-robot"].speed * settings.startup["robot-speed-multiplier"].value

data.raw["construction-robot"]["construction-robot"].max_energy = 2000 * settings.startup["robot-battery-size-multiplier"].value .. "kJ"
data.raw["construction-robot"]["construction-robot"].energy_per_move = 5 * settings.startup["robot-energy-usage-multiplier"].value .. "kJ"
data.raw["construction-robot"]["construction-robot"].energy_per_tick = "0kW"
data.raw["construction-robot"]["construction-robot"].max_payload_size = data.raw["construction-robot"]["construction-robot"].max_payload_size * settings.startup["robot-carry-size-multiplier"].value
data.raw["construction-robot"]["construction-robot"].speed = data.raw["construction-robot"]["construction-robot"].speed* settings.startup["robot-speed-multiplier"].value

data.raw["roboport"]["roboport"].energy_source.buffer_capacity = "1MJ"
data.raw["roboport"]["roboport"].energy_source.input_flow_limit = 5 * settings.startup["roboport-charging-rate-multiplier"].value .. "MW"
data.raw["roboport"]["roboport"].charging_energy = 1 * settings.startup["roboport-charging-rate-multiplier"].value .. "MW"
data.raw["roboport"]["roboport"].energy_usage = "0kW"
data.raw["roboport"]["roboport"].logistics_radius = data.raw["roboport"]["roboport"].logistics_radius * settings.startup["roboport-logistics-radius-multiplier"].value
data.raw["roboport"]["roboport"].construction_radius = data.raw["roboport"]["roboport"].construction_radius * settings.startup["roboport-construction-radius-multiplier"].value

-- Enables recipes


for i, v in pairs(data.raw["technology"]["logistic-robotics"]["effects"]) do
data.raw["recipe"][v.recipe].enabled = true
end
data.raw["recipe"]["construction-robot"].enabled = true
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
for i, v in pairs(data.raw["technology"]["logistic-system"]["effects"]) do
data.raw["recipe"][v.recipe].enabled = true
end

-- Changes cost of recipes

data.raw["recipe"]["logistic-robot"].ingredients = 
{
    {"iron-plate", 1},
    {"iron-gear-wheel", 1},
    {"electronic-circuit", 1},
}           
data.raw["recipe"]["construction-robot"].ingredients = 
{
    {"iron-plate", 1},
    {"iron-gear-wheel", 1},
    {"electronic-circuit", 1},
}
data.raw["recipe"]["logistic-chest-passive-provider"].ingredients = 
{
                  {"iron-plate", 3},
                  {"electronic-circuit", 1},
}
data.raw["recipe"]["logistic-chest-storage"].ingredients = 
{
                  {"iron-plate", 3},
                  {"electronic-circuit", 1},
}
      for i, v in pairs(data.raw["technology"]["logistic-system"]["effects"]) do
            data.raw["recipe"][v.recipe].ingredients = 
            {
                  {"iron-plate", 3},
                  {"electronic-circuit", 1},
            }
      end
data.raw["recipe"]["roboport"].ingredients = 
{
  {"iron-plate", 25},
  {"iron-gear-wheel", 10},
  {"electronic-circuit", 10}
}

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

-- Adds some new technologies

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



-- Adds logistic cargo wagons

local util = require('util')

local item = {
  type = "item-with-entity-data",
  name = "logistic-cargo-wagon",
  icon = "__robotworld__/graphics/icons/logistic-cargo-wagon.png",
  icon_size = 32,
  flags = {},
  subgroup = "transport",
  order = "a[train-system]-gz[logistic-cargo-wagon]",
  place_result = "logistic-cargo-wagon",
  stack_size = 5,
}

local recipe = {
  type = "recipe",
  name = "logistic-cargo-wagon",
  enabled = false,
  ingredients = {
    {"cargo-wagon", 1},
    {"logistic-chest-requester", 1},
    {"logistic-chest-active-provider", 1},
  },
  result = "logistic-cargo-wagon"
}


local wagon = util.table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
wagon.name = "logistic-cargo-wagon"
wagon.color = {r = 0.47, g = 0.16, b = 0.58, a = 0.9}
wagon.icon = "__robotworld__/graphics/icons/logistic-cargo-wagon.png"
wagon.minable.result = "logistic-cargo-wagon"

local player = util.table.deepcopy(data.raw["player"]["player"])
player.name = "logistic-cargo-wagon-proxy-player"
player.collision_mask = {"ghost-layer"}

data:extend({ item, recipe, wagon, player })

-- Adds logistic assembling machines


data:extend(
{

--- logistic-assembling-machine
{
    type = "assembling-machine",
    name = "logistic-assembling-machine",
    icon = "__robotworld__/graphics/logistic-assembling-machine.png",
    icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-assembling-machine"},
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(-3, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, 0	}, {1.5, 1.5}},
    drawing_box = {{-1.5, -1.7}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
          priority = "high",
          width = 108,
          height = 119,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -0.5),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
          priority = "high",
          width = 130,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(28, 4),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        },
      },
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210kW",
    ingredient_count = 6,
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  
--- invisible-inserter
{
    type = "inserter",
    name = "invisible-inserter",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 32,
    stack = true,
    minable =
    {
      hardness = 0.2,
      mining_time = 0.5,
      result = "invisible-inserter"
    },
    max_health = 160,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{0,0}, {0,0}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "20KW",
    energy_per_rotation = "20KW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.1kW"
    },
    extension_speed = 0.5,
    rotation_speed = 0.5,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-base.png",
      priority = "extra-high",
      width = 1,
      height = 1,
     
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-closed.png",
      priority = "extra-high",
      width = 1,
      height = 1,
      
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-open.png",
      priority = "extra-high",
      width = 1,
      height = 1,
     
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 1,
      height = 1,
      
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 1,
      height = 1,
      
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 1,
      height = 1,
      
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/stack-inserter/stack-inserter-platform.png",
        priority = "extra-high",
        width = 1,
        height = 1,        
      }
    },
  },
  {
    type = "inserter",
    name = "invisible-inserter-2",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 32,
    stack = true,
    minable =
    {
      hardness = 0.2,
      mining_time = 0.5,
      result = "invisible-inserter"
    },
    max_health = 160,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{0,0}, {0,0}},
    pickup_position = {0, 1.2},
    insert_position = {0, -1},
    energy_per_movement = "20KW",
    energy_per_rotation = "20KW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.1kW"
    },
    extension_speed = 0.5,
    rotation_speed = 0.5,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-base.png",
      priority = "extra-high",
      width = 1,
      height = 1,
     
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-closed.png",
      priority = "extra-high",
      width = 1,
      height =1,
      
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-open.png",
      priority = "extra-high",
      width = 1,
      height = 1,
     
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 1,
      height = 1,
      
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 1,
      height = 1,
      
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 1,
      height =1,
      
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/stack-inserter/stack-inserter-platform.png",
        priority = "extra-high",
        width = 1,
        height = 1,        
      }
    },
  },
  --- invisible-substation
  {
    type = "electric-pole",
    name = "invisible-substation",
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 32,
    minable = {hardness = 0.2, mining_time = 0.5, result = "invisible-substation"},
    max_health = 200,
    corpse = "medium-remnants",
    track_coverage_during_build_by_moving = true,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0, -0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    drawing_box = {{-1, -3}, {1, 1}},
    maximum_wire_distance = 18,
    supply_area_distance = 9,
    pictures =
    {
      filename = "__base__/graphics/entity/substation/substation.png",
      priority = "high",
      width = 1,
      height = 1,
      direction_count = 1,
      shift = {0.9, -1}
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    connection_points =
    {
      {
        shadow =
        {
          copper = {1.9, -0.6},
          green = {1.3, -0.6},
          red = {2.65, -0.6}
        },
        wire =
        {
          copper = {-0.25, -2.71875},
          green = {-0.84375, -2.71875},
          red = {0.34375, -2.71875}
        }
      },
 
   
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 1,
      height = 1,
      priority = "extra-high-no-scale"
    },
  },
  })
  
  
  
--- assembling-provider
local assprov = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-passive-provider"]);
assprov.name = "assembling-provider";
assprov.minable = {mining_time = 0.001, result = nil};
assprov.flags = nil;
data:extend({assprov})

local assprovitem = util.table.deepcopy(data.raw["item"]["logistic-chest-passive-provider"])
assprovitem.name = "assembling-provider";
assprovitem.place_result = "assembling-provider";
data:extend({assprovitem})




--- assembling-requester
local assreq = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-requester"]);
assreq.name = "assembling-requester";
assreq.minable = {mining_time = 0.001, result = nil};
assreq.flags = nil;
data:extend({assreq})

local assreqitem = util.table.deepcopy(data.raw["item"]["logistic-chest-requester"])
assreqitem.name = "assembling-requester";
assreqitem.place_result = "assembling-requester";
data:extend({assreqitem})



data:extend(
{

--- logistic-assembling-machine
 {
    type = "item",
    name = "logistic-assembling-machine",
    icon = "__robotworld__/graphics/logistic-assembling-machine.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "d[logistic-assembling-machine]",
    place_result = "logistic-assembling-machine",
    stack_size = 50
  },
  
  {
    type = "recipe",
    name = "logistic-assembling-machine",
    enabled = true,
    ingredients =
    {
      {"assembling-machine-1", 2},
	  {"logistic-chest-passive-provider", 1},
	  {"logistic-chest-requester", 1},
	  {"inserter", 2},
    },
    result = "logistic-assembling-machine"
  },
  
  
--- invisible-inserter

{
    type = "item",
    name = "invisible-inserter",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "f[stack-inserter]",
    place_result = "invisible-inserter",
    stack_size = 50
  },

  {
    type = "item",
    name = "invisible-inserter-2",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "f[stack-inserter]",
    place_result = "invisible-inserter-2",
    stack_size = 50
  },

  --- invisible-substation
  
  {
    type = "item",
    name = "invisible-substation",
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 32,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-d[substation]",
    place_result = "invisible-substation",
    stack_size = 50
  },
  

  })

table.insert(data.raw["technology"]["railway"].effects, {type = "unlock-recipe", recipe = "logistic-cargo-wagon"})
