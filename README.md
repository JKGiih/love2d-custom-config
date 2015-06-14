# love2d-custom-config
Implementation of a custom config file (config.cfg) that allows the user to adjust the properties of a LÖVE game.

Currently the file only has options for resolution and volume, but in theory it could be used to customize anything,
including any game-specific values not covered by the standard conf.lua file.

Included for demonstration purposes is a simple skeleton for a game with three (mostly empty) states (splash screen,
game, game over) and basic player movement. The code is taken from my game Falling Old Ladies and edited to allow
vertical movement.
