if turtle then return end -- we're not needed so we'll just exit

_G.turtle = {} -- create dummy API
local turtle = _G.turtle
turtle.toetle = {} -- insert our subAPI which will make the other one work
turtle.toetle.lists = {} -- where we store our responces
turtle.toetle.indexes = {}
turtle.toetle.states = {}
turtle.toetle.nativeStates = {}
turtle.toetle.knownTurtleFunctions = {}

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
local knownTurtleFunctions = turtle.toetle.knownTurtleFunctions
nativeStates.loop = loopHandler
nativeStates.random = randomHandler
nativeStates.interactive = interactiveHandler

-- fill list of turtle functions
do
knownTurtleFunctions.craft = true
knownTurtleFunctions.forward = true
knownTurtleFunctions.back = true
knownTurtleFunctions.up = true
knownTurtleFunctions.down = true
knownTurtleFunctions.turnLeft = true
knownTurtleFunctions.turnRight = true
knownTurtleFunctions.select = true
knownTurtleFunctions.getSelectedSlot = true
knownTurtleFunctions.getItemCount = true
knownTurtleFunctions.getItemSpace = true
knownTurtleFunctions.getItemDetail = true
knownTurtleFunctions.equipLeft = true
knownTurtleFunctions.equipRight = true
knownTurtleFunctions.attack = true
knownTurtleFunctions.attackUp = true
knownTurtleFunctions.attackDown = true
knownTurtleFunctions.dig = true
knownTurtleFunctions.digUp = true
knownTurtleFunctions.digDown = true
knownTurtleFunctions.place = true
knownTurtleFunctions.placeUp = true
knownTurtleFunctions.placeDown = true
knownTurtleFunctions.inspect = true
knownTurtleFunctions.inspectUp = true
knownTurtleFunctions.inspectDown = true
knownTurtleFunctions.compare = true
knownTurtleFunctions.compareUp = true
knownTurtleFunctions.compareDown = true
knownTurtleFunctions.compareTo = true
knownTurtleFunctions.drop = true
knownTurtleFunctions.dropUp = true
knownTurtleFunctions.dropDown = true
knownTurtleFunctions.suck = true
knownTurtleFunctions.suckUp = true
knownTurtleFunctions.suckDown = true
knownTurtleFunctions.refuel = true
knownTurtleFunctions.getFuelLevel = true
knownTurtleFunctions.getFuelLimit = true
knownTurtleFunctions.transferTo = true
end





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

local turtleMeta = {}
local toetleMeta = {}
setmetatable(turtle, turtleMeta)
setmetatable(turtle.toetle, toetleMeta)
function turtleMeta.__newindex(t,k,v)
  error("Toetle: this functon is not initualised")
end
function turtleMeta.__index(t,k,...) -- when users call a turtle function it this is what actually happens
  if (not states.k) then
    error("Toetle: This function has no handler and probably has not been initualised.",2)
  else
    if type(states.k) ~= "function" then
      error("Toetle: state must be a function",2)
    end
    r = state.k(...)
    if type(r) ~= "table" then
      error("Toetle: handler functions must return a table",2)
    end
    return unpack(r)
  end
end


function toetleMeta.__index(t,k,...) -- initualise turtle functions
  -- look up in known turtle functions
  local args = {...}
  if not knownTurtleFunctions[k] then
    error("Toetle: not a known turtle function, check your spelling. If it's a new function then you can add it to the list (turtle.toetle.knownTurtleFunctions."..k.." = true) and Toetle will do the rest.",2)
  else
    if not states.k then
    states.k = nativeStates.loop
  end
  if not indexes.k then
    indexes.k = 1
  end
  if not lists.k then
    lists.k = {}
  end
  if not args[1] then
    -- user wants nil
    lists.k[indexes.k] = {}
  else
    -- user has given data which needs to be added to the list of responces
    lists.k[indexes.k] = args
  end
  end
end





return turtle -- just in case people want to load us this way
