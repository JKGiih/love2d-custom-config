player = {}

function player.initialize()
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local setCanvas = love.graphics.setCanvas
   local canvasScale = canvasScale
   playerWidth = 4
   playerHeight = 4
   playerX = screenWidth / 2 - playerWidth / 2
   playerY = screenHeight / 2 - playerHeight / 2
   playerCanvas = love.graphics.newCanvas(playerWidth * canvasScale, playerHeight * canvasScale)
   setCanvas(playerCanvas)
   playerCanvas:clear()
   setColor(255, 255, 255)
   rectangle('fill', 0, 0, playerWidth * canvasScale, playerHeight * canvasScale)
   setCanvas()
end

function player.update(dt)
   local isDown = love.keyboard.isDown
   local horizontalDirection = nil
   local verticalDirection = nil
   if table.getn(gamepads) >= 1 then
      for i = 1, table.getn(gamepads) do
         if gamepads[i]:isGamepadDown("dpleft") then
            horizontalDirection = "left"
         elseif gamepads[i]:isGamepadDown("dpright") then
            horizontalDirection = "right"
         end
         if gamepads[i]:isGamepadDown("dpup") then
            verticalDirection = "up"
         elseif gamepads[i]:isGamepadDown("dpdown") then
            verticalDirection = "down"
         end
      end
   end
   if isDown("left") or isDown("a") or horizontalDirection == "left" then
      playerX = playerX - dt * 30
   end
   if isDown("right") or isDown("d") or horizontalDirection == "right" then
      playerX = playerX + dt * 30
   end
   if isDown("up") or isDown("w") or verticalDirection == "up" then
      playerY = playerY - dt * 30
   end
   if isDown("down") or isDown("s") or verticalDirection == "down" then
      playerY = playerY + dt * 30
   end
   if playerX < 2 then playerX = 2 end
   if playerX > screenWidth - playerWidth - 2 then
      playerX = screenWidth - playerWidth - 2
   end
   if playerY < 2 then playerY = 2 end
   if playerY > screenHeight - playerHeight - 2 then
      playerY = screenHeight - playerHeight - 2
   end
end

function player.draw()
   local canvasScale = canvasScale
   love.graphics.push()
   love.graphics.scale(scale / canvasScale)
   love.graphics.draw(playerCanvas, (widescreenOffset + graphics.lockToGrid(playerX)) * canvasScale, playerY * canvasScale, 0, 1, 1)
   love.graphics.pop()
end
