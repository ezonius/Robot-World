require("prototypes.functions")
local early_energy_updates=function()
  -- if settings.startup["enable-for-all-tiers"].value == true then
  for i, v in pairs(data.raw["logistic-robot"]) do
    if tableContains(v.flags, "hidden") then goto continuelogisticrobotloop end
    v.max_energy = MultiplyEnergy(v.max_energy, settings.startup["robot-battery-size-multiplier"].value)
    v.max_energy = MultiplyEnergy(v.max_energy, settings.startup["logistics-robot-battery-size-multiplier"].value)
    v.energy_per_move = MultiplyEnergy(v.energy_per_move, settings.startup["robot-energy-usage-multiplier"].value)
    v.energy_per_move = MultiplyEnergy(v.energy_per_move, settings.startup["logistics-robot-energy-usage-multiplier"].value)
    v.energy_per_tick = MultiplyEnergy(v.energy_per_tick, settings.startup["robot-energy-tick-usage-multiplier"].value)
    v.energy_per_tick = MultiplyEnergy(v.energy_per_tick, settings.startup["logistics-robot-energy-tick-usage-multiplier"].value)
    v.max_payload_size = v.max_payload_size * settings.startup["robot-carry-size-multiplier"].value * settings.startup["logistics-robot-carry-size-multiplier"].value
    v.speed = v.speed * settings.startup["robot-speed-multiplier"].value * settings.startup["logistics-robot-speed-multiplier"].value
    v.max_health = v.max_health * settings.startup["robot-health-multiplier"].value
    -- workaround for 248k
    if data.raw["item"][v.name] == nil then
      if mods["248k"] then
        itemname = string.gsub(v.name, "_entity", "_item")
        data.raw["item"][itemname].stack_size = settings.startup["robot-stack-size"].value
      end
    else 
      data.raw["item"][v.name].stack_size = settings.startup["robot-stack-size"].value
    end
    ::continuelogisticrobotloop::
  end

  for i, v in pairs(data.raw["construction-robot"]) do
    if tableContains(v.flags, "hidden") then goto continueconstructionrobotloop end
    v.max_energy = MultiplyEnergy(v.max_energy, settings.startup["robot-battery-size-multiplier"].value)
    v.max_energy = MultiplyEnergy(v.max_energy, settings.startup["construction-robot-battery-size-multiplier"].value)
    v.energy_per_move = MultiplyEnergy(v.energy_per_move, settings.startup["robot-energy-usage-multiplier"].value)
    v.energy_per_move = MultiplyEnergy(v.energy_per_move, settings.startup["construction-robot-energy-usage-multiplier"].value)
    v.energy_per_tick = MultiplyEnergy(v.energy_per_tick, settings.startup["robot-energy-tick-usage-multiplier"].value)
    v.energy_per_tick = MultiplyEnergy(v.energy_per_tick, settings.startup["construction-robot-energy-tick-usage-multiplier"].value)

        v.max_payload_size = v.max_payload_size * settings.startup["robot-carry-size-multiplier"].value *
            settings.startup["construction-robot-carry-size-multiplier"].value
        v.speed = v.speed * settings.startup["robot-speed-multiplier"].value *
            settings.startup["construction-robot-speed-multiplier"].value
        v.max_health = v.max_health * settings.startup["robot-health-multiplier"].value
        -- workaround for 248k
        if data.raw["item"][v.name] == nil then
            if mods["248k"] then
                itemname = string.gsub(v.name, "_entity", "_item")
                data.raw["item"][itemname].stack_size = settings.startup["robot-stack-size"].value
            end
        else
            data.raw["item"][v.name].stack_size = settings.startup["robot-stack-size"].value
        end
        ::continueconstructionrobotloop::
    end
    local groups = { "roboport", "roboport-equipment" }
    local vanilla_roboports = {
        ["roboport"] = true,
        ["personal-roboport-equipment"] = true,
        ["personal-roboport-mk2-equipment"] = true
    }
    for _, group_name in pairs(groups) do
        for i, v in pairs(data.raw[group_name]) do
            if not vanilla_roboports[v.name] and settings.startup["only-modify-vanilla-roboport"].value then
                goto continue
            end
            v.energy_source.buffer_capacity = MultiplyEnergy(v.energy_source.buffer_capacity,
                settings.startup["roboport-buffer-multiplier"].value)
            -- v.energy_source.buffer_capacity = "1MJ"
            v.energy_source.input_flow_limit = MultiplyEnergy(v.energy_source.input_flow_limit,
                settings.startup["roboport-charging-rate-multiplier"].value)
            -- v.energy_source.input_flow_limit = 5 * settings.startup["roboport-charging-rate-multiplier"].value .. "MW"
            v.charging_energy = MultiplyEnergy(v.charging_energy,
                settings.startup["roboport-charging-rate-multiplier"].value)
            -- v.charging_energy = 1 * settings.startup["roboport-charging-rate-multiplier"].value .. "MW"
            v.energy_usage = MultiplyEnergy(v.energy_usage, settings.startup["roboport-energy-usage-multiplier"].value)
            -- v.energy_usage = "0kW"
            if group_name ~= "roboport" then
                goto continue
            end
            logistics_rad = v.logistics_radius
            construction_rad = v.construction_radius
            if settings.startup["roboport-logistics-radius-value"].value >= 0 then
                logistics_rad = settings.startup["roboport-logistics-radius-value"].value
            end
            if settings.startup["roboport-construction-radius-value"].value >= 0 then
                construction_rad = settings.startup["roboport-construction-radius-value"].value
            end
            v.logistics_radius = logistics_rad * settings.startup["roboport-logistics-radius-multiplier"].value
            v.construction_radius = construction_rad * settings.startup["roboport-construction-radius-multiplier"].value
            ::continue::
        end
    end
end

local inserter_speed_updates=function()
  for i, v in pairs(data.raw["inserter"]) do
    v.extension_speed = v.extension_speed * settings.startup["inserter-speed-multiplier"].value
    v.rotation_speed = v.rotation_speed * settings.startup["inserter-speed-multiplier"].value
  end
end

-- Enables recipes
local enable_early_recipes=function()
  if settings.startup["enable-early-logistic-robots"].value then
    for i, v in pairs(data.raw["technology"]["logistic-robotics"]["effects"]) do
      enableRecipes(v.recipe)
    end
  end

  if settings.startup["enable-early-construction-robots"].value then
    enableRecipes("roboport")
    enableRecipes("construction-robot")
    enableRecipes("passive-provider-chest")
    enableRecipes("storage-chest")
  end

  if mods["recursive-blueprints"] then
    enableRecipes("blueprint-deployer")
    replaceIngredient("blueprint-deployer", {
      {"iron-chest", 3},
      {"electronic-circuit", 1}
    })
    for i, v in pairs(data.raw["technology"]["circuit-network"]["effects"]) do
      enableRecipes(v.recipe)
    end
  end

  if settings.startup["enable-early-logistic-system"].value then
    for i, v in pairs(data.raw["technology"]["logistic-system"]["effects"]) do
      enableRecipes(v.recipe)
    end
  end
end

function early_recipe_updates()
  if settings.startup["disable-mod-recipes"].value then
    return
  end
  robot_ingredient = {
    {"iron-plate", 1},
    {"iron-gear-wheel", 1},
    {"electronic-circuit", 1},
  }
  chest_ingredient = {
    {"iron-plate", 3},
    {"electronic-circuit", 1},
  }
  roboport_ingredient = {
    {"iron-plate", 25},
    {"iron-gear-wheel", 10},
    {"electronic-circuit", 10}
  }
  -- Changes cost of recipes
  if settings.startup["enable-early-logistic-robots"].value then
    replaceIngredient("logistic-robot", robot_ingredient)
  end
  if settings.startup["enable-early-construction-robots"].value then
    replaceIngredient("construction-robot", robot_ingredient)
  end

  if (settings.startup["enable-early-logistic-robots"].value or settings.startup["enable-early-construction-robots"].value) then
    replaceIngredient("passive-provider-chest", chest_ingredient)
    replaceIngredient("storage-chest", chest_ingredient)
    replaceIngredient("roboport", roboport_ingredient)
  end
  if settings.startup["enable-early-logistic-system"].value then
    replaceIngredient("active-provider-chest", chest_ingredient)
    replaceIngredient("requester-chest", chest_ingredient)
    replaceIngredient("buffer-chest", chest_ingredient)
  end

  -- Makes electronic-circuits into basic-circuit-boards if bobelectronics is enabled
  if mods["bobelectronics"] then
    if settings.startup["enable-early-logistic-robots"].value then
      replaceIngredientItem("logistic-robot","electronic-circuit", "basic-circuit-board", 1)
    end
    if settings.startup["enable-early-construction-robots"].value then
      replaceIngredientItem("construction-robot","electronic-circuit", "basic-circuit-board", 1)
    end

    if (settings.startup["enable-early-logistic-robots"].value or settings.startup["enable-early-construction-robots"].value) then
      replaceIngredientItem("passive-provider-chest","electronic-circuit", "basic-circuit-board", 1)
      replaceIngredientItem("storage-chest","electronic-circuit", "basic-circuit-board", 1)
      replaceIngredientItem("roboport","electronic-circuit", "basic-circuit-board", 10)
    end
    if settings.startup["enable-early-logistic-system"].value then
      replaceIngredientItem("active-provider-chest","electronic-circuit", "basic-circuit-board", 1)
      replaceIngredientItem("requester-chest","electronic-circuit", "basic-circuit-board", 1)
      replaceIngredientItem("buffer-chest","electronic-circuit", "basic-circuit-board", 1)
    end
  end
end

local enable_early_tech = function()
    -- Adds some new technologies

    if mods["aai-containers"] and settings.startup["enable-early-logistic-system"].value then
        local post_logistics_research = { "aai-strongbox-logistic", "aai-storehouse-logistic",
            "aai-warehouse-logistic" }
        for _, name in pairs(post_logistics_research) do
            local newPrereq = {}
            for _, prereq in pairs(data.raw.technology[name].prerequisites) do
                if prereq ~= "logistic-system" then
                    table.insert(newPrereq, prereq)
                end
            end
            data.raw.technology[name].prerequisites = newPrereq

            local newIngredients = {}
            for _, ingredient in pairs(data.raw.technology[name].unit.ingredients) do
                if ingredient[1] ~= "space-science-pack" then
                    table.insert(newIngredients, ingredient)
                end
            end
            data.raw.technology[name].unit.ingredients = newIngredients
        end
    end
    if (settings.startup["enable-early-logistic-robots"].value or settings.startup["enable-early-construction-robots"].value) then
        data.raw.technology["worker-robots-storage-1"].prerequisites = { "early-worker-robots-storage" }
        data.raw.technology["worker-robots-speed-1"].prerequisites = { "early-worker-robots-speed" }

    data:extend({
      --early logistics slots
      {
        type = "technology",
        name = "early-character-logistic-slots",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/logistic-robotics.png",
        effects =
        {
          {
            type = "character-logistic-requests",
            modifier = true
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
      --early trash slots
      {
        type = "technology",
        name = "early-character-logistic-trash-slots",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/logistic-robotics.png",
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
      --early worker speed
      {
        type = "technology",
        name = "early-worker-robots-speed",
        icon_size = 256, icon_mipmaps = 4,
        icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
        effects =
        {
          {
            type = "worker-robot-speed",
            modifier = 0.3
          },

        },
        prerequisites = {"logistics"},
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
      --early worker cargo capacity
      {
        type = "technology",
        name = "early-worker-robots-storage",
        icon_size = 256, icon_mipmaps = 4,
        icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
        effects =
        {
          {
            type = "worker-robot-storage",
            modifier = 1
          },
        },
        prerequisites = {"logistics"},
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
end

function run_early_updates()
  enable_early_recipes()
  --early_recipe_updates()
  enable_early_tech()
end

function run_later_updates()
  early_energy_updates()
  inserter_speed_updates()
  
  for i, v in pairs(data.raw["roboport"]) do
    -- log(serpent.block(v))
    if v.logistics_connection_distance ~= nil then
      if v.logistics_radius > v.logistics_connection_distance then
        v.logistics_connection_distance = v.logistics_radius
      end
    end
  end
end
