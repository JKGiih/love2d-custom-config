splash = {}

function splash.initialize()
   -- TODO
end

function splash.update(dt)
   -- TODO
end

function splash.draw()
   -- TODO
end

function splash.gamepadpressed(joystick, button)
   if button == "a" or button == "start" or button == "back" then
      game.initialize()
      state = "game"
   end
end

function splash.keypressed(key)
   if key == "return" or key == " " or key == "escape" then
      game.initialize()
      state = "game"
   elseif key == "f11" then
      graphics.toggleFullscreen()
   end
end
