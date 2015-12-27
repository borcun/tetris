-- @file block.lua
-- @brief The class has a block base properties
-- @date Dec 26, 2015
-- @author boo
-- @copyright open source

require( "utility" )

-- Meta Class
Block = { id, block_t, frequency, speed, color_t, state_t }
Block.__index = Block

-- constructor
function Block:new( id, block_t, name, frequency, speed, color_t )
   self = setmetatable( {}, Block )

   self.m_id = id
   self.m_type = type_t
   self.m_frequency = frequency_t
   self.m_speed = speed_t
   self.m_color = color_t or DEFAULT_COLOR
   self.name = name
   self.m_state = INVALID_STATE
   
   return self
end

-- function that gets block ID
function Block:getID()
   return self.m_id
end

-- function that sets block type
function Block:setType( type_t )
   self.m_type = type_t
end

-- function that gets block type
function Block:getType()
   return self.m_type
end

-- function that sets block name
function Block:setName( name )
   self.name = name
end

-- function that gets block name
function Block:getName()
   return self.name
end

-- function that sets block frequency
function Block:setFrequency( frequency_t )
   self.m_frequency = frequency_t
end

-- function that gets block frequency
function Block:getFrequency()
   return self.m_frequency
end

-- function that sets block speed
function Block:setSpeed( speed_t )
   self.m_speed = speed_t
end

-- function that gets block speed
function Block:getSpeed()
   return self.m_speed
end

-- function that sets block color
function Block:setColor( color_t )
   self.m_color = color_t
end

-- function that gets block color
function Block:getColor()
   return self.m_color
end

-- function that sets block state
function Block:setState( state_t )
   self.m_state = state_t
end

-- function that gets block state
function Block:getState()
   return self.m_state
end

-- tostring
function Block:tostring()
   return self.getType()
end
