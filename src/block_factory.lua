-- @file block_factory.h
-- @brief BlockFactory class is a factory pattern for Block class
-- @date Dec 26, 2015
-- @author boo
-- @copyright open source

require( "block" )

BlockFactory = { block_list = {},
                 index = 0
               }

BlockFactory.__index = BlockFactory
   
-- constructor
function BlockFactory:new()
   self = setmetatable( {}, BlockFactory )   
   return self
end

-- function that creates Block instance and gets its id
function BlockFactory:create( type_t )  
   if B_SQUARE == type_t then
      table.insert( self.block_list, Block:new( self.index, type_t, N_SQUARE, F_SQUARE, DEFAULT_SPEED, C_SQUARE ) )
      self.index = self.index + 1
      return self.index
   elseif B_STICK == type_t then
      table.insert( self.block_list, Block:new( self.index, type_t, N_STICK, F_STICK, DEFAULT_SPEED, C_STICK ) )
      self.index = self.index + 1
      return self.index
   elseif B_L == type_t then
      table.insert( self.block_list,  Block:new( self.index, type_t, N_L, F_L, DEFAULT_SPEED, C_L ) )
      self.index = self.index + 1
      return self.index
   elseif B_Z == type_t then
      table.insert( self.block_list, Block:new( self.index, type_t, N_Z, F_Z, DEFAULT_SPEED, C_Z ) )
      self.index = self.index + 1
      return self.index
   elseif B_REVERSE_Z == type_t then
      table.insert( self.block_list, Block:new( self.index, type_t, N_REVERSE_Z, F_REVERSE_Z, DEFAULT_SPEED, C_REVERSE_Z ) )
      self.index = self.index + 1
      return self.index
   elseif B_T == type_t then
      table.insert( self.block_list, Block:new( self.index, type_t, N_T, F_T, DEFAULT_SPEED, C_T ) )
      self.index = self.index + 1
      return self.index
   else
      return FAIL
   end
end

-- function that removes block from list. If it can, return true. Otherwise, return false.
function BlockFactory:destory( index )
   if 0 <= self.index and index <= self.index then
      table.remove( self.block_list, index )
      return true
   end

   return false
end

-- function that gets Block instance. If it is not in list, return nil.
function BlockFactory:get( index )
   if 0 <= index or self.index <= index then
      for k, v in ipairs( self.block_list ) do 
         if index == k then
            return v
         end
      end
   end

   return nil
end

-- function that gets size of table
function BlockFactory:size()
   return table.maxn( self.block_list )
end
