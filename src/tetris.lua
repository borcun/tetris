-- @file tetris.lua
-- @brief
-- @date Dec 28, 2015
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

-- function that initializes the game
function Tetris:init( name )
   self.engine:configure( name )
   self.engine:createRandomArray()
   return true
end

-- function that starts the game
function Tetris:play()
   self.engine:run()
   return true
end

-- function that stops the game
function Tetris:stop()
   self.engine:wait()
   return true
end

-- function that resumes the stopped game
function Tetris:resume()
   
end

-- function that quits from the game
function Tetris:quit()
   -- TODO exit operation will be improved
   os.exit()
end
