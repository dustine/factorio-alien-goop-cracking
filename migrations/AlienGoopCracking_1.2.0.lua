local bobplates = false
local angelsrefining = false

for mod, _ in pairs(game.active_mods) do
  if mod == 'bobplates' then
    bobplates = true
  elseif mod == 'angelsrefining' then
    angelsrefining = true
  end
end

if bobplates or angelsrefining then
  for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    recipes['alien-goop-cracking-fill-barrel'].enabled = false
    recipes['alien-goop-cracking-empty-barrel'].enabled = false

    if technologies['barrels'] and technologies['barrels'].researched then
      recipes['alien-goop-cracking-fill-bob-barrel'].enabled = true
      recipes['alien-goop-cracking-empty-bob-barrel'].enabled = true
    end

    if technologies['angels-fluid-barreling'] and technologies['angels-fluid-barreling'].researched then
      recipes['angels-fill-alien-goop-cracking-goop-barrel'].enabled = true
      recipes['angels-empty-alien-goop-cracking-goop-barrel'].enabled = true
    end
  end
end

