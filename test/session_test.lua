require( "session" )

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

session = Session:new()
session:setName( "orcun" )
session:score( 10 )

io.write( "session name : ", session:getName(), "\n" )
io.write( "session score : ", session:getScore(), "\n" )
io.write( "session duration : ", session:getDuration(), "\n" )
   
session:startTimer()
sleep( 3 )
session:stopTimer()

io.write( "session duration : ", session:getDuration(), "\n" )
