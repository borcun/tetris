-- @file engine.lua
-- @brief
-- @date Dec 27, 2015
-- @author boo
-- @copyright open source

require( "block_factory" )
require( "session" )

Engine = {}
Engine.__index = Engine

-- constructor
function Engine:new()
   self = setmetatable( {}, Engine )
   self.block_factory = BlockFactory:new()
   self.session = Session:new()
   self.block_list = {}
   self.random_array = {}
   self.random_size = math.floor( MAX_FREQUENCY * ( MAX_FREQUENCY + 1 ) / 2 )
   math.randomseed( os.time() )
      
   return self
end

-- function that runs engine
function Engine:run()
   local cur_block = {}
   local next_block = {}
   local rand_index = math.random( 0, self.random_size - 1 )
   local block_type = self.random_array[ rand_index ]
   local block_index = self.block_factory:create( block_type )

   if FAIL == block_index then
      print( "The current block can not created" )
      os.exit()
   end
   
   cur_block = self.block_factory:get( block_index );

   rand_index = math.random( 0, self.random_size - 1 )
   block_type = self.random_array[ rand_index ]
   block_index = self.block_factory:create( block_type )

   if FAIL == block_index then
      print( "The next block can not created" )
      os.exit()
   end

   next_block = self.block_factory:get( block_index );
   
   for i = 0, 10, 1 do
      io.write( cur_block:getName() )
      io.write( " [ next ", next_block:getName(), " ]\n" )
      cur_block = next_block;

      rand_index = math.random( 0, self.random_size - 1 )
      block_type = self.random_array[ rand_index ]
      block_index = self.block_factory:create( block_type )

      if FAIL == block_index then
         print( "The next block can not created" )
         os.exit()
      end
         
      next_block = self.block_factory:get( block_index );
   end
end

-- function that creates an array with frequencies of block to provide truly random
function Engine:createRandomArray()
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
end
