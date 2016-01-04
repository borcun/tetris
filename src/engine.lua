-- @file engine.lua
-- @brief
-- @date Dec 27, 2015
-- @author boo
-- @copyright open source

require( "block_factory" )
require( "session" )

Engine = { block_factory, session, block_list, random_array, random_size }
Engine.__index = Engine

-- constructor
function Engine:new()
   self = setmetatable( {}, Engine )
   self.block_factory = BlockFactory:new()
   self.session = Session:new()
   self.block_list = {}
   self.random_array = {}
   self.random_size = math.floor( MAX_FREQUENCY * ( MAX_FREQUENCY + 1 ) / 2 )
   self.cur_block = Block:new()
   self.next_block = Block:new()
   self.state = STOPPED
   math.randomseed( os.time() )

   return self
end

-- function that configure engine
function Engine:configure( name )
   self.session:setName( name )
end

-- function that creates an array with frequencies of block to provide truly random
function Engine:init()
   -- TODO: create a random array with truly random number generator algorithm

   self.random_array[ 0 ] = B_T
   self.random_array[ 1 ] = B_STICK
   self.random_array[ 2 ] = B_STICK
   self.random_array[ 3 ] = B_Z
   self.random_array[ 4 ] = B_Z
   self.random_array[ 5 ] = B_Z
   self.random_array[ 6 ] = B_REVERSE_Z
   self.random_array[ 7 ] = B_REVERSE_Z
   self.random_array[ 8 ] = B_REVERSE_Z
   self.random_array[ 9 ] = B_REVERSE_Z
   self.random_array[ 10 ] = B_L
   self.random_array[ 11 ] = B_L
   self.random_array[ 12 ] = B_L
   self.random_array[ 13 ] = B_L
   self.random_array[ 14 ] = B_L
   self.random_array[ 15 ] = B_SQUARE
   self.random_array[ 16 ] = B_SQUARE
   self.random_array[ 17 ] = B_SQUARE
   self.random_array[ 18 ] = B_SQUARE
   self.random_array[ 19 ] = B_SQUARE
   self.random_array[ 20 ] = B_SQUARE

   local rand_index = math.random( 0, self.random_size - 1 )
   local block_type = self.random_array[ rand_index ]
   local block_index = self.block_factory:create( block_type )
   
   if FAIL == block_index then
      print( "The block can not created" )
      os.exit()
   end

   table.insert( self.block_list, block_index )
   self.next_block = self.block_factory:get( block_index );
   self.cur_block = self.next_block
end

-- function that starts the engine
function Engine:start()
   if STOPPED == self.state then
      io.write( "The game is started for ", self.session:getName(), "\n" )
      self.session:startTimer()
      self.state = ENG_PLAY
   end

   return self.state
end

-- function that samples the game
function Engine:sample()
   if STOPPED == self.state then
      return {}
   end

   local blocks = {}
   local rand_index = math.random( 0, self.random_size - 1 )
   local block_type = self.random_array[ rand_index ]
   local block_index = self.block_factory:create( block_type )
   
   if FAIL == block_index then
      print( "The current block can not created" )
      os.exit()
   end

   table.insert( self.block_list, block_index )
   self.next_block = self.block_factory:get( block_index );

   blocks[ 1 ] = self.cur_block
   self.cur_block = self.next_block;
   blocks[ 2 ] = self.next_block

   return blocks
end

-- function that stops the game
function Engine:stop()
   if ENG_PLAY == self.state then
      self.state = ENG_STOP
      self.session:stopTimer()
   end

   return self.state
end

-- function that resumes the game
function Engine:resume()
   if ENG_STOP == self.state then
      self.state = ENG_PLAY
      self.session:startTimer()
   end

   return self.state
end

-- function that quits from game
function Engine:quit()
   self.state = ENG_QUIT
   self.session:stopTimer()

   return self.state
end

-- function that gets engine message
function Engine:message()
   if ENG_STOP == self.state then
      return "The game is stopped\n" .. 
	 "The duration is " .. 
	 self.session:getDuration() ..
	 "\nThe score is " ..
	 self.session:score( 5 ) .. "\n"
   elseif ENG_QUIT == self.state then
      return "The game is over\n" .. 
	 "The duration is " .. 
	 self.session:getDuration() ..
	 "\nThe score is " ..
	 self.session:score( 10 ) .. "\n"
   else
      return "No message"
   end
end
