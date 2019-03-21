-- Enables recipes based on settings

if (settings.startup["enable-early-logistic-robots"].value) then
for i, v in pairs(data.raw["technology"]["logistic-robotics"]["effects"]) do
data.raw["recipe"][v.recipe].enabled = true
end
end
if (settings.startup["enable-early-construction-robots"].value) then
for i, v in pairs(data.raw["technology"]["construction-robotics"]["effects"]) do
data.raw["recipe"][v.recipe].enabled = true
end
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
