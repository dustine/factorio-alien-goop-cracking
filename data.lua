if not aliengoopcracking then aliengoopcracking = {} end
require 'config'

function union(lht, rht)
    for k, v in pairs(rht) do
        if (type(v) == "table") and (type(lht[k] or false) == "table") then
            union(lht[k], rht[k])
        else
            lht[k] = v
        end
    end
    return lht
end

function newTableFrom(original, parameters)
  local newObject = table.deepcopy(original)
  return union(newObject, parameters)
end

require 'prototypes/achievements'
require 'prototypes/entity/resources'
require 'prototypes/fluid/fluids'
require 'prototypes/item/items'
-- require 'prototypes/item/debug'
require 'prototypes/recipe/recipes'
require 'prototypes/technology/technologies'
