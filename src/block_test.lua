require( "block_factory" )

bf = BlockFactory:new()

io.write( "square is created, id is ", bf:create( B_SQUARE ), "\n" )
io.write( "block list size is ", bf:size(), "\n" )
io.write( "stick is created, id is ", bf:create( B_STICK ), "\n" )
io.write( "block list size is ", bf:size(), "\n" )
io.write( "L is created, id is ", bf:create( B_L ), "\n" )
io.write( "block list size is ", bf:size(), "\n" )
io.write( "Z is created, id is ", bf:create( B_Z ), "\n" )
io.write( "block list size is ", bf:size(), "\n\n" )

io.write( "stick is removed, operation is ", tostring( bf:destory( 2 ) ), "\n" )
io.write( "block list size is ", bf:size(), "\n\n" )

sq = bf:get( 1 )
io.write( "block type is ", sq:getType(), " id is ", sq:getID(), " from list", "\n" )
lblock = bf:get( 2 )
io.write( "block type is ", lblock:getType(), " id is ", lblock:getID(), " from list", "\n" )
zblock = bf:get( 3 )
io.write( "block type is ", zblock:getType(), " id is ", zblock:getID(), " from list", "\n" )
