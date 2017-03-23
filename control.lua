require 'stdlib/area/position'
require 'stdlib/entity/entity'
require 'stdlib/event/event'
require 'stdlib/area/area'

-- should be fine desync-wise as it's loading a local file
config = require 'config' 

function distanceToOrigin(pos) 
  return Position.distance(pos, Position.construct(0,0))
end

function calculateAmount(pos) 
  -- Magic number: size of a chunk, in tiles (x,y)
  local center = (distanceToOrigin(pos) * config.increasePerChunk) / 32;
  local amount = center + config.goopVariance * (math.random() - 0.5)
  return math.floor(math.max(config.minimumGoop, amount * config.baselineGoop))
end

Event.register(defines.events.on_entity_died, function(event)
  if event.entity.type == 'unit-spawner' and math.random() < config.goopChance then
    local pos = Area.center(Entity.to_collision_area(event.entity))
    event.entity.surface.create_entity {
      name = 'alien-goop-cracking-goop', 
      position = pos, 
      amount = calculateAmount(pos)
    }
  end
end)