if turtle then return end -- we're not needed so we'll just exit



turtle = {} -- create dummy API
turtle.toetle = {} -- insert our subAPI which will make the other one work
turtle.toetle.lists = {} -- where we store our responces
turtle.toetle.indexes = {}
turtle.toetle.states = {}
turtle.toetle.nativeStates = {}

-- predeclare state handling functions
local loopHandler
local randomHandler
local interactiveHandler

-- cache for quicker access
local toetle = turtle.toetle
local lists = toetle.lists
local indexes = toetle.indexes
local states = turtle.toetle.states
local nativeStates = turtle.toetle.nativeStates
nativeStates.loop = loopHandler
nativeStates.random = randomHandler
nativeStates.interactive = interactiveHandler

-- generic handler functions for responce types

function loopHandler()
  -- return the next responce from the list
  local r = lists.TEMPLATE[indexes.TEMPLATE]
  indexes.TEMPLATE = indexes.TEMPLATE + 1
  if lists.TEMPLATE[indexes.TEMPLATE] == nil then
    indexes.TEMPLATE = 1
  end
  return r
end
function randomHandler()
  -- return a random responce from the list
  return list.TEMPLATE[math.random(#list.TEMPLATE)]
end
function interactiveHandler()
  -- prompt user for input
  -- TODO
end

-- can I do this with meta tables?


-- add turtle functions
-- TODO - template mostly done
-- http://computercraft.info/wiki/Turtle_(API)

function turtle.TEMPLATE()
  -- TODO: Interactive mode
  -- TODO: Random mode
  if (not states.TEMPLATE) then
    error("Toetle: This function has no handler and probably has not been initualised.",2)
  else
    if type(states.TEMPLATE) ~= "function" then
      error("Toetle: state must be a function which returns a responce as a table",2)
    end
    return unpack(state.TEMPLATE())
  end
end


-- add toetle functions
-- likely will change to a sub table
function toetle.TEMPLATE(...)
  local args = {...}
  if not states.TEMPLATE then
    states.TEMPLATE = nativeStates.loop
  end
  if not indexes.TEMPLATE then
    indexes.TEMPLATE = 1
  end
  if not lists.TEMPLATE then
    lists.TEMPLATE = {}
  end
  if not args[1] then
    -- user wants nil
    lists.TEMPLATE[indexes.TEMPLATE] = {}
  else
    -- user has given data which needs to be added to the list of responces
    lists.TEMPLATE[indexes.TEMPLATE] = args
  end
end



return turtle -- just in case people want to load us this way
