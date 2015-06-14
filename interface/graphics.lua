graphics = {}

function graphics.initialize()
   screenWidth, screenHeight = 64, 48
   defaultWidth, defaultHeight = love.window.getDimensions()
   local full = false
   graphics.calculateScale()
   canvasScale = 16
end

function graphics.toggleFullscreen()
   love.window.setFullscreen(not love.window.getFullscreen(), "desktop")
   graphics.calculateScale()
end

function graphics.loadFonts()
   font1 = love.graphics.newFont("fonts/font1.ttf", 12 * scale)
   font2 = love.graphics.newFont("fonts/font2.ttf", 8 * scale)
end

function graphics.calculateScale()
   if love.window.getFullscreen() then
      scale = love.window.getHeight() / screenHeight
      widescreenOffset = (love.window.getWidth() / scale - screenWidth) / 2
   else
      scale = defaultHeight / screenHeight
      widescreenOffset = 0
   end
   halfScale = scale / 2
   graphics.loadFonts()
end

function graphics.lockToGrid(coordinate)
   local correction = coordinate % 1
   if correction < 0.5 then
      return coordinate - correction
   else
      return coordinate - correction + 1
   end 
end

function graphics.lockToGridRoundUp(coordinate)
   return coordinate - coordinate % 1
end
