-- Allows logistic robots, construction robots, and roboports to be configured
function MultiplyEnergy(src, multiplier)
  if type(src) ~= "string" then
    return src
  end
  local EnergyNum, EnergyUnit = src:match("(%d+%.?%d*)(%a+)")
  return EnergyNum * multiplier .. EnergyUnit
end
-- helper functions
--Enable Recipes
function enableRecipes(n)
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
function replaceIngredient(n, ing)
  local r = data.raw["recipe"][n]
  if r then
    if r.expensive == nil and r.normal == nil then
      r.ingredients = {table.unpack(ing)}
      return
    end
    if r.expensive then
      r.expensive.ingredients = {table.unpack(ing)}
    end
    if r.normal then
      r.normal.ingredients = {table.unpack(ing)}
    end
  end
end
--replace single ingredient
function replaceIngredientItem_f(recipe, old, new, amount)
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
function replaceIngredientItem(recipe, old, new, amount)
  if type(recipe) == "string" then recipe = data.raw.recipe[recipe] end
  if not recipe then return end
  if recipe.ingredients then
    replaceIngredientItem_f(recipe, old, new, amount)
  end
  if recipe.normal and recipe.normal.ingredients then
    replaceIngredientItem_f(recipe.normal, old, new, amount)
  end
  if recipe.expensive and recipe.expensive.ingredients then
    replaceIngredientItem_f(recipe.expensive, old, new, amount)
  end
end
