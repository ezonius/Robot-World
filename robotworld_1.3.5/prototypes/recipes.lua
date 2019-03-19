if (settings.startup["enable-early-logistic-robots"].value) then
data.raw["recipe"]["logistic-robot"].enabled = true
data.raw["recipe"]["roboport"].enabled = true
data.raw["recipe"]["logistic-chest-passive-provider"].enabled = true
data.raw["recipe"]["logistic-chest-storage"].enabled = true
end
if (settings.startup["enable-early-construction-robots"].value) then
data.raw["recipe"]["construction-robot"].enabled = true
data.raw["recipe"]["roboport"].enabled = true
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
data.raw["recipe"]["logistic-chest-passive-provider"].enabled = true
data.raw["recipe"]["logistic-chest-storage"].enabled = true
data.raw["recipe"]["logistic-chest-active-provider"].enabled = true
data.raw["recipe"]["logistic-chest-buffer"].enabled = true
data.raw["recipe"]["logistic-chest-requester"].enabled = true
end

if (mods["bobelectronics"]) then
if (settings.startup["enable-early-logistic-robots"].value) then
data.raw["recipe"]["logistic-robot"].ingredients = 
{
    {"iron-plate", 1},
    {"iron-gear-wheel", 1},
    {"basic-circuit-board", 1},
}
end
if (settings.startup["enable-early-construction-robots"].value) then
data.raw["recipe"]["construction-robot"].ingredients = 
{
    {"iron-plate", 1},
    {"iron-gear-wheel", 1},
    {"basic-circuit-board", 1},
}
end
if (settings.startup["enable-early-logistic-system"].value) then
data.raw["recipe"]["logistic-chest-passive-provider"].ingredients = 
{
  {"iron-plate", 3},
  {"basic-circuit-board", 1},
}

data.raw["recipe"]["logistic-chest-active-provider"].ingredients = 
{
  {"iron-plate", 3},
  {"basic-circuit-board", 1},
}

data.raw["recipe"]["logistic-chest-storage"].ingredients = 
{
  {"iron-plate", 3},
  {"basic-circuit-board", 1},
}

data.raw["recipe"]["logistic-chest-requester"].ingredients = 
{
  {"iron-plate", 3},
  {"basic-circuit-board", 1},
}

data.raw["recipe"]["logistic-chest-buffer"].ingredients = 
{
  {"iron-plate", 3},
  {"basic-circuit-board", 1},
}
end
if (settings.startup["enable-early-construction-robots"].value or settings.startup["enable-early-logistic-robots"].value) then
data.raw["recipe"]["roboport"].ingredients = 
{
  {"iron-plate", 25},
  {"iron-gear-wheel", 10},
  {"basic-circuit-board", 10}
}
end
end


if (not mods["bobelectronics"]) then
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
data.raw["recipe"]["logistic-chest-passive-provider"].ingredients = 
{
  {"iron-plate", 3},
  {"electronic-circuit", 1},
}

data.raw["recipe"]["logistic-chest-active-provider"].ingredients = 
{
  {"iron-plate", 3},
  {"electronic-circuit", 1},
}

data.raw["recipe"]["logistic-chest-storage"].ingredients = 
{
  {"iron-plate", 3},
  {"electronic-circuit", 1},
}

data.raw["recipe"]["logistic-chest-requester"].ingredients = 
{
  {"iron-plate", 3},
  {"electronic-circuit", 1},
}

data.raw["recipe"]["logistic-chest-buffer"].ingredients = 
{
  {"iron-plate", 3},
  {"electronic-circuit", 1},
}
end
if (settings.startup["enable-early-construction-robots"].value or settings.startup["enable-early-logistic-robots"].value) then
data.raw["recipe"]["roboport"].ingredients = 
{
  {"iron-plate", 25},
  {"iron-gear-wheel", 10},
  {"electronic-circuit", 10}
}
end
end