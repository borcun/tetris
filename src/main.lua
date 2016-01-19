-- @file main.lua
-- @brief main
-- @date Dec 28, 2015
-- @author boo
-- @copyright open source

require( "tetris" )

tetris = Tetris:new()
blocks = {}
command = "i"
msg = ""

-- function that configures window
function love.config( w )
   w.screen.height = HEIGHT
   w.screen.width = WIDTH
   w.screen.title = TITLE

   tetris = Tetris:new()
end

-- function that is called when the application is loaded
function love.load()
   love.graphics.setBackgroundColor( RED, GREEN, BLUE )
   --image = love.graphics.newImage("square.jpeg")
   --quad = love.graphics.newQuad(0, 0, 128, 64, image:getWidth(), image:getHeight())
   
   tetris:init( "orcun" )
end

-- function that is called periodically
function love.update( dt )
   if PLAY == command then
      print( "sample" )
      blocks = tetris:blocks()
      sleep( 1 )
   end
end

-- function that renders the application
function love.draw()
   if INIT == command then
      msg = "Press \'space\' button to start the game"
   elseif STOP == command then
      if ENG_STOP == tetris:stop() then
	 command = IDLE
	 msg = tetris:state()
      else
	 msg = "The game is not stopped"
      end
   elseif RESUME == command then
      if ENG_PLAY == tetris:resume() then
	 command = PLAY
	 msg = "The game is begin resumed"
      else
	 msg = "The game is not begin resumed"
      end
   elseif START == command then
      command = PLAY
      tetris:play()
   elseif QUIT == command then
      if ENG_QUIT == tetris:finish() then
	 command = IDLE
	 msg = tetris:state()
      else
	 msg = "The game is not over"
      end
   elseif PLAY == command then
      if 0 ~= #blocks then
	 msg = blocks[ 1 ]:getName() .. " [ next " .. blocks[ 2 ]:getName() .. " ] "
      end
   elseif "d" == command then
      love.graphics.rectangle( "fill", 100, 100, 10, 10 )
      --love.graphics.draw(image, quad, 100, 100)
   end

   love.graphics.print( msg , 300, 600 )
end

-- function that handles keyboard keys
function love.keypressed( key, scancode, isrepeat )
   command = key
end
