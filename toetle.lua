if turtle then return end -- we're not needed so we'll just exit

turtle = {} -- create dummy API
turtle.toetle = {} -- insert our subAPI which will make the other one work
turtle.toetle.lists = {} -- where we store our responces
turtle.toetle.indexes = {}

-- cache for quicker access
local toetle = turtle.toetle
local lists = toetle.lists
local indexes = toetle.indexes

-- add turtle functions
-- TODO
-- http://computercraft.info/wiki/Turtle_(API)

function turtle.TEMPLATE()
  if (not lists.TEMPLATE) or (not indexes.TEMPLATE) then
    error("No responces for this function.",2)
  else
    local r = lists.TEMPLATE[indexes.TEMPLATE]
    indexes.TEMPLATE = indexes.TEMPLATE + 1
    if lists.TEMPLATE[indexes.TEMPLATE] == nil then
      indexes.TEMPLATE = 1
    end
    return unpack(r)
  end
end


-- add toetle functions
-- TODO

function toetle.TEMPLATE(...)
  args = {...}
  if not indexes.TEMPLATE then
    indexes.TEMPLATE = 1
  end
  if not lists.TEMPLATE then
    lists.TEMPLATE = {}
  end
  if not args[1] then
    -- user wants nil
    lists.TEMPLATE[indexes.TEMPLATE] = {}
  end
    
end



return turtle -- just in case people want to load us this way
