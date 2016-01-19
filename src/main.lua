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
-- table to hold all our physical objects
objects = {}

-- function that configures window
function love.config( w )
   w.screen.height = HEIGHT
   w.screen.width = WIDTH
   w.screen.title = TITLE

   tetris = Tetris:new()
end

-- function that is called when the application is loaded
function love.load()
   --the height of a meter our worlds will be 64px
   love.physics.setMeter(64)
   --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
   world = love.physics.newWorld(0, 9.81*64, true) 
   love.graphics.setBackgroundColor( RED, GREEN, BLUE )   
 
   objects.ground = {}
   objects.ground.body = love.physics.newBody( world, 10, 10 ) 
   objects.ground.shape = love.physics.newRectangleShape( WIDTH - 10, HEIGHT / 2 )
   objects.ground.fixture = love.physics.newFixture( objects.ground.body, objects.ground.shape )

   objects.field = {}
   objects.field.body = love.physics.newBody( world, 220, HEIGHT / 2 - 10) 
   objects.field.shape = love.physics.newRectangleShape( 400, HEIGHT - 100 )
   objects.field.fixture = love.physics.newFixture( objects.field.body, objects.field.shape, 5 )

   tetris:init( "orcun" )
end

-- function that is called periodically
function love.update( dt )
   if PLAY == command then
      world:update( dt )
      print( "sample" )
      blocks = tetris:blocks()

      objects.block1 = {}
      objects.block2 = {}
      objects.block1.body = love.physics.newBody( world, CUR_POS_X, CUR_POS_Y, "dynamic" )
      objects.block2.body = love.physics.newBody( world, NEXT_POS_X, NEXT_POS_Y, "dynamic" )
      objects.block1.color = blocks[ 1 ]:getColor()
      objects.block2.color = blocks[ 2 ]:getColor()

      if B_SQUARE == blocks[ 1 ]:getType() then
	 objects.block1.shape = love.physics.newRectangleShape( 0, 0, D_SQUARE, D_SQUARE )
      elseif B_STICK == blocks[ 1 ]:getType() then
	 objects.block1.shape = love.physics.newRectangleShape( 0, 0, D_STICK_HEIGHT, D_STICK_WIDTH )
      else
	 objects.block1.shape = love.physics.newRectangleShape( 0, 0, D_STICK_HEIGHT, D_STICK_WIDTH )
      end

      if B_SQUARE == blocks[ 2 ]:getType() then
	 objects.block2.shape = love.physics.newRectangleShape( 0, 0, D_SQUARE, D_SQUARE )
      elseif B_STICK == blocks[ 2 ]:getType() then
	 objects.block2.shape = love.physics.newRectangleShape( 0, 0, D_STICK_HEIGHT, D_STICK_WIDTH )
      else
	 objects.block2.shape = love.physics.newRectangleShape( 0, 0, D_STICK_HEIGHT, D_STICK_WIDTH )
      end

      objects.block1.fixture = love.physics.newFixture( objects.block1.body, objects.block1.shape, 5 )
      objects.block2.fixture = love.physics.newFixture( objects.block2.body, objects.block2.shape, 5 )

      sleep( 2 )
   end
end

-- function that renders the application
function love.draw()
   if INIT == command then
      msg = "Press \'space\'"
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
      love.graphics.setColor( 255, 255, 255, 100 )
      love.graphics.polygon("line", objects.field.body:getWorldPoints(objects.field.shape:getPoints()))

      if 0 ~= #blocks then
	 msg = blocks[ 1 ]:getName() .. " [ next " .. blocks[ 2 ]:getName() .. " ] "
	 color1 = 40 * objects.block1.color
	 color2 = 40 * objects.block2.color

	 love.graphics.setColor( color1, color1, color1, 100 )
	 love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
	 love.graphics.setColor( color2, color2, color2, 100 )
	 love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
      end
   end

   love.graphics.print( msg , HEIGHT - 2, 20 )
end

-- function that handles keyboard keys
function love.keypressed( key, scancode, isrepeat )
   command = key
end
