-- @file utility.lua
-- @brief
-- @date Dec 25, 2015
-- @author boo
-- @copyright open source

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

-- state
INVALID_STATE = -1
PASSIVE = 0
ACTIVE = 1

-- line point
POINT = 1
