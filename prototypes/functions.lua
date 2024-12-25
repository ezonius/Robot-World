-- Allows logistic robots, construction robots, and roboports to be configured
function MultiplyEnergy(src, multiplier)
  if type(src) ~= "string" then
    return src
  end
  local EnergyNum, EnergyUnit = src:match("(%d+%.?%d*)(%a+)")
  return EnergyNum * multiplier .. EnergyUnit
end
-- helper functions

function TableContains(table, value)
  if table == nil then return false end
  for i = 1,#table do
    if (table[i] == value) then
      return true
    end
  end
  return false
end

--Enable Recipes
function EnableRecipes(n)
  local r = data.raw["recipe"][n]
  if r then
    if r.expensive == nil and r.normal == nil then
      r.enabled = true
      return
    end
    if r.expensive then
      r.expensive.enabled = true
    end
    if r.normal then
      r.normal.enabled = true
    end
  end
end
--replace all Ingredients
function ReplaceIngredient(n, ing)
  local r = data.raw["recipe"][n]
  local ingredients = {}
  
  for k, v in ipairs(ing) do 
    ingredients[k] = { type="item", name=v[1], amount=v[2] }
  end

  if r then
    if r.expensive == nil and r.normal == nil then
      r.ingredients = ingredients
      return
    end
    if r.expensive then
      r.expensive.ingredients = ingredients
    end
    if r.normal then
      r.normal.ingredients = ingredients
    end
  end
end
--replace single ingredient
function ReplaceIngredientItem_f(recipe, old, new, amount)
  local found = false
  if old then
    for i, component in pairs(recipe.ingredients) do
      for _, value in pairs(component) do
        if value == old then
          found = true
          recipe.ingredients[i] = {type="item", name=new, amount=amount}
          break
        end
      end
    end
  end
  if not found then
    table.insert(recipe.ingredients, {type="item", name=new, amount=amount})
  end
end
--replace ingredient items 2
function ReplaceIngredientItem(recipe, old, new, amount)
  if type(recipe) == "string" then recipe = data.raw.recipe[recipe] end
  if not recipe then return end
  if recipe.ingredients then
    ReplaceIngredientItem_f(recipe, old, new, amount)
  end
  if recipe.normal and recipe.normal.ingredients then
    ReplaceIngredientItem_f(recipe.normal, old, new, amount)
  end
  if recipe.expensive and recipe.expensive.ingredients then
    ReplaceIngredientItem_f(recipe.expensive, old, new, amount)
  end
end
