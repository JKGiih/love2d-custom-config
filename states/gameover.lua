gameover = {}

function gameover.initialize()
   if soundAvailable then
      -- stop any looping sound effects
   end 
end

function gameover.update(dt)
   -- TODO
end

function gameover.draw()
   -- TODO
end

function gameover.gamepadpressed(joystick, button)
   if button == "a" or button == "start" or button == "back" then
      splash.initialize()
      state = "splash"
   end
end

function gameover.keypressed(key)
   if key == "return" or key == " " or key == "escape" then
      splash.initialize()
      state = "splash"
   elseif key == "f11" then
      graphics.toggleFullscreen()
   end
end
