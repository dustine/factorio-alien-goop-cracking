local mods = game.active_mods

if mods.angelsbioprocessing or mods.angelsrefining or mods.bobplates or mods.bobenemies then
  for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    -- fix barrel recipes
    if mods.bobplates or mods.angelsrefining then
      local fill = recipes['alien-goop-cracking-fill-barrel']
      local empty = recipes['alien-goop-cracking-empty-barrel']

      fill.enabled = false
      empty.enabled = false

      if mods.angelsrefining then
        if technologies['angels-fluid-barreling'] and technologies['angels-fluid-barreling'].researched then
          fill.enabled = true
          empty.enabled = true
        end
      elseif mods.bobplates then
        if technologies['barrels'] and technologies['barrels'].researched then
          fill.enabled = true
          empty.enabled = true
        end
      end

      force.reset_recipes()
    end

    -- add new rainbow congealing
    if mods.bobenemies then
      if technologies['alien-technology'].researched then
        recipes['alien-goop-cracking-rainbow-congelation'].enabled = true
      end
    end

    -- add new bacteria recipe
    if mods.angelsbioprocessing then
      if technologies['alien-technology'].researched then
        recipes['alien-goop-cracking-bacteria'].enabled = true
      end
    end

    force.reset_technologies()
  end
end
