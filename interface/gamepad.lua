gamepad = {}

function gamepad.initialize()
   local getn = table.getn
   local insert = table.insert
   local remove = table.remove
   gamepads = love.joystick.getJoysticks()
   local joysticksToRemove = {}
   if love.joystick.getJoystickCount() >= 1 then
      for i = 1, getn(gamepads) do
         if not gamepads[i]:isGamepad() then
            insert(joysticksToRemove, i)
         end
      end
      for i = 1, getn(joysticksToRemove) do
         remove(gamepads, joysticksToRemove[i])
      end
   end
end

