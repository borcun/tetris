-- @file tetris.lua
-- @brief tetris game
-- @date Jan 7, 2016
-- @author boo
-- @copyright open source

require( "engine" )

Tetris = { engine }
Tetris.__index = Tetris

-- constructor
function Tetris:new()
   self = setmetatable( {}, Tetris )
   self.engine = Engine:new()
   return self
end

-- function that initialize the tetris
function Tetris:init( name )
   self.engine:configure( name )
   self.engine:init()
end

-- function that gets two block which are current and next
function Tetris:blocks()
   return self.engine:sample()
end

-- function that gets information state
function Tetris:state()
   return self.engine:message()
end

-- function that starts the tetris
function Tetris:play()
   self.engine:start()
end

-- function that stops the tetris
function Tetris:stop()
   return self.engine:stop()
end

-- function that resume the tetris
function Tetris:resume()
   return self.engine:resume()
end

-- function that finishes the tetris
function Tetris:finish()
   return self.engine:quit()
end
