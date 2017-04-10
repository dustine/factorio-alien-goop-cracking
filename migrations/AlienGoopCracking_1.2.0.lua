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

        if bobplates then
            if technologies['barrels'] and technologies['barrels'].researched then
                recipes['alien-goop-cracking-fill-barrel'].enabled = true
                recipes['alien-goop-cracking-empty-barrel'].enabled = true
            end
        elseif angelsrefining then
            if technologies['angels-fluid-barreling'] and technologies['angels-fluid-barreling'].researched then
                recipes['alien-goop-cracking-goop-fill-barrel'].enabled = true
                recipes['alien-goop-cracking-goop-empty-barrel'].enabled = true
            end
        end
    end
end
