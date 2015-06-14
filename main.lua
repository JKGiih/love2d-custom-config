require('states/game')
require('states/gameover')
require('states/splash')
require('objects/player')
require('interface/config')
require('interface/gamepad')
require('interface/graphics')
require('interface/audio')

function love.load()
   minDt = 1/30
   nextTime = love.timer.getTime()
   config.load()
   graphics.initialize()
   gamepad.initialize()
   audio.initialize()
   splash.initialize()
   state = "splash"
end

function love.update(dt)
   nextTime = nextTime + minDt
   if state == "splash" then
      splash.update(dt)
   elseif state == "game" and not paused then
      game.update(dt)
   elseif state == "gameover" then
      gameover.update(dt)
   end
end

function love.draw()
   if state == "splash" then
      splash.draw()
   elseif state == "game" then
      game.draw()
   elseif state == "gameover" then
      gameover.draw()
   end
   local currentTime = love.timer.getTime()
   if nextTime <= currentTime then nextTime = currentTime return end
   love.timer.sleep(nextTime - currentTime)
end

function love.gamepadpressed(joystick, button)
   if state == "splash" then
      splash.gamepadpressed(joystick, button)
   elseif state == "game" then
      game.gamepadpressed(joystick, button)
   elseif state == "gameover" then
      gameover.gamepadpressed(joystick, button)
   end
end

function love.gamepadreleased(joystick, button)
   if state == "game" then
      game.gamepadreleased(joystick, button)
   end
end

function love.keypressed(key)
   if state == "splash" then
      splash.keypressed(key)
   elseif state == "game" then
      game.keypressed(key)
   elseif state == "gameover" then
      gameover.keypressed(key)
   end
end

function love.keyreleased(key)
   if state == "game" then
      game.keyreleased(key)
   end
end

function love.focus(f)
   if state == "game" then
      game.focus(f)
   end
end
