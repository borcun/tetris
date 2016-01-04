-- @file main.lua
-- @brief main
-- @date Dec 28, 2015
-- @author boo
-- @copyright open source

require( "engine" )

engine = Engine:new()
blocks = {}
command = "i"
msg = ""

-- function that configures window
function love.config( w )
   w.screen.height = 300
   w.screen.width = 300
   w.screen.title = "Tetris"

   engine = Engine:new()
end

-- function that is called when the application is loaded
function love.load()
   engine:configure( "orcun" )
   engine:init()
end

-- function that is called periodically
function love.update( dt )
   if PLAY == command then
      print( "sample" )
      blocks = engine:sample()
      sleep( 1 )
   end
end

-- function that renders the application
function love.draw()
   if INIT == command then
      msg = "Press \'space\' button to start the game"
   elseif STOP == command then
      if ENG_STOP == engine:stop() then
	 command = IDLE
	 msg = engine:message()
      else
	 msg = "The game is not stopped"
      end
   elseif RESUME == command then
      if ENG_PLAY == engine:resume() then
	 command = PLAY
	 msg = "The game is begin resumed"
      else
	 msg = "The game is not begin resumed"
      end
   elseif START == command then
      command = PLAY
      engine:start()
   elseif QUIT == command then
      if ENG_QUIT == engine:quit() then
	 command = IDLE
	 msg = engine:message()
      else
	 msg = "The game is not over"
      end
   elseif PLAY == command then
      if 0 ~= #blocks then
	 msg = blocks[ 1 ]:getName() .. " [ next " .. blocks[ 2 ]:getName() .. " ] "
      end
   end

   love.graphics.print( msg , 100, 100 )
end

-- function that handles keyboard keys
function love.keypressed( key, scancode, isrepeat )
   command = key
end
