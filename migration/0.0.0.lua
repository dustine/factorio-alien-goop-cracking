for index, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  if technologies['fluid-handling'].researched then
    recipes['aliengoopcracking-fill-barrel'].enabled = true
    recipes['aliengoopcracking-empty-barrel'].enabled = true
  end
  if technologies['alien-technology'].researched then
    recipes['aliengoopcracking-congelation'].enabled = true
    recipes['aliengoopcracking-cotton-candy'].enabled = true
  end
end