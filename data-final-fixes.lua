-- Misanthrope 0.7 fix
if data.raw.tree["spawner-damaged"] then
  data.raw.tree["spawner-damaged"].collision_mask = {}
end