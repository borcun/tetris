-- @file main.lua
-- @brief main
-- @date Dec 28, 2015
-- @author boo
-- @copyright open source

require( "tetris" )

-- function that configures window
function love.config( w )
   w.screen.height = 300
   w.screen.width = 300
   w.screen.title = "Tetris"
end

-- function that is called when the application is loaded
function love.load()
   tetris = Tetris:new()

   tetris:init( "orcun" )
   tetris:play()
end

-- function that is called periodically
function love.update( dt )
end

-- function that renders the application
function love.draw()

end
