local mods = game.active_mods

if mods.angelsbioprocessing or mods.angelsrefining or mods.bobplates or mods.bobenemies then
  for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    -- fix barrel recipes
    if mods.bobplates or mods.angelsrefining then
      local fill = recipes['alien-goop-cracking-fill-barrel']
      local empty = recipes['alien-goop-cracking-empty-barrel']

      log('Disabled Barreling recipes')
      fill.enabled = false
      empty.enabled = false

      if mods.angelsrefining then
        if technologies['angels-fluid-barreling'] and technologies['angels-fluid-barreling'].researched then
          log('Reenabled Barreling recipes recipes (angel)')
          fill.enabled = true
          empty.enabled = true
        end
      elseif mods.bobplates then
        if technologies['barrels'] and technologies['barrels'].researched then
          log('Reenabled Barreling recipes recipes (bob)')
          fill.enabled = true
          empty.enabled = true
        end
      end
    end

    -- add new rainbow congealing
    if mods.bobenemies then
      if technologies['alien-technology'].researched then
        log('Enabled Rainbow Congelation recipe')
        recipes['alien-goop-cracking-rainbow-congelation'].enabled = true
      end
    end

    -- add new bacteria recipe
    if mods.angelsbioprocessing then
      if technologies['alien-technology'].researched then
        log('Enabled Alien Bacteria from Alien Goop recipe')
        recipes['alien-goop-cracking-bacteria'].enabled = true
      end
    end
  end
end
