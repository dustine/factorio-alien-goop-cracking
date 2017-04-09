local Proto = {}

local function union(lht, rht)
  for k, v in pairs(rht) do
    if (type(v) == "table") and (type(lht[k] or false) == "table") then
      union(lht[k], rht[k])
    else
      lht[k] = v
    end
  end
  return lht
end

Proto.newFrom = function (originalProto, newProto)
  return union(table.deepcopy(originalProto), newProto)
end

return Proto