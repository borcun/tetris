[ Dec 25, 2015 ]

I decided to develop a tetris game with love2d in last days of the year.
The base target is learning the love2d framework along this development process.

The game has to contain some requirements which are both functional and non-functional.

Functional Requirements =
 - it has to cover all functionalities with known old tetris game.
 - blocks are square, stick, L, plus, z and reverse z. ( other characters may be added such as u )
 - block frequency is determined according to block type.
   while plus has the smallest frequency, square has the biggest frequency.
   according to game level, they may be changed.
 - the game has three modes: learn mode, time mode and score mode.
 - the game control is performed arrow and space buttons.
 - it can show next blocks, display score or time.

Non-Functional Requirements =
 - The programming language is Lua, library is love2d and environment is linux x64 ( fedora 22 ).
 - if the c or cpp integration ability is obtained, they may be used in source code.
 - the version control system is git.
 - the editor is emacs. Perhaps, ZeroBrane Studio may be used.
 - the design tool is DIA.

[ Dec 26, 2015 ]

- The class diagram is completed slightly. There will be more.
- Block class is implemented.

[ Dec 27, 2015 ]

- The class diagram is improved but still uncompleted.
- Reverse L block type will be added.
- BlockFactory class is implemented.
- Session class is implemented.
- Engine class is being worked. Truly random number generator array will be created.
  Now, it is created by static.
- Engine:run function is managed a lua thread or love2d thread if it is possible.
- Current Block and Next Block algorithm is implemented.