-- @file utility.lua
-- @brief
-- @date Dec 25, 2015
-- @author boo
-- @copyright open source

-- game state
ENG_STOP = 0
ENG_PLAY = 1
ENG_QUIT = 2

-- screen width and height
WIDTH = 400
HEIGHT = 640
TITLE = "TETRIS"

-- backgroud color codes
RED = 255
GREEN = 153
BLUE = 204

-- key command
INIT = "i"
STOP = "s"
RESUME = "r"
START = " "
QUIT = "q"
IDLE = "x"

-- fail and success
FAIL = -1
SUCCESS = 0

-- block_t
INVALID_BLOCK = -1
B_SQUARE = 1
B_STICK = 2
B_L = 3
B_Z = 4
B_REVERSE_Z = 5
B_T = 6

-- block name
INVALID_NAME = nil
N_SQUARE = "square"
N_STICK = "stick"
N_L = "l"
N_Z = "z"
N_REVERSE_Z = "z"
N_T = "t"

-- frequency_t
INVALID_FREQ = 0
MIN_FREQUENCY = 1
F_T = 1
F_STICK = 2
F_Z = 3
F_REVERSE_Z = 4
F_L = 5
F_SQUARE = 6
MAX_FREQUENCY = 6

-- speed_t
DEFAULT_SPEED = 1
S_10 = 10
S_50 = 50
S_100 = 100

-- color_t
DEFAULT_COLOR = 0
C_SQUARE = 1
C_STICK = 2
C_L = 3
C_Z = 4
C_REVERSE_Z = 5
C_T = 6

-- line point
POINT = 1

function sleep( n )
  local t0 = os.clock()
  while os.clock() - t0 <= n do end
end
