require 'stdlib/entity/entity'
require 'stdlib/event/event'
require 'stdlib/area/area'

local aliengoopcracking = require 'config' or {} 

Event.register(defines.events.on_entity_died, function(event)
  if event.entity.type == 'unit-spawner' and math.random() < aliengoopcracking.goopChance then
    local position = Area.center(Entity.to_collision_area(event.entity))
    event.entity.surface.create_entity {name='aliengoopcracking-goop', position=position}
  end
end)