-- @file session.lua
-- @brief
-- @date Dec 27, 2015
-- @author boo
-- @copyright

require( "utility" )

Session = { point, name, duration }
Session.__index = Session

-- constructor
function Session:new()
   self = setmetatable( {}, Session )
   self.point = 0
   self.name = "player"
   self.duration = 0
   self.starttime = 0
   
   return self
end

-- function that sets session name
function Session:setName( name )
   self.name = name
end

-- function that gets session name
function Session:getName()
   return self.name
end

-- function that gets score
function Session:getScore()
   return self.point
end

-- function that gets game duration
function Session:getDuration()
   return self.duration
end

-- function that calculates total game score
function Session:score( line )
   self.point = self.point + line * POINT
end

-- function that start timer
function Session:startTimer()
   self.starttime = os.time()
end

-- function that stops timer
function Session:stopTimer()
   self.duration = self.duration + os.difftime( os.time(), self.starttime )
end


