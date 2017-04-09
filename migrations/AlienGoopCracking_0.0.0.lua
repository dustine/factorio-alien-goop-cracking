for _, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  if technologies['fluid-handling'].researched then
    recipes['alien-goop-cracking-fill-barrel'].enabled = true
    recipes['alien-goop-cracking-empty-barrel'].enabled = true
  end
  if technologies['alien-technology'].researched then
    recipes['alien-goop-cracking-congelation'].enabled = true
    recipes['alien-goop-cracking-cotton-candy'].enabled = true
  end
end