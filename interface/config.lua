config = {}

function config.load()
   if love.filesystem.isFused() then
      local dir = love.filesystem.getSourceBaseDirectory()
      love.filesystem.mount(dir, "gamedir")
   end
   if love.filesystem.exists("gamedir/icon.png") then
      love.window.setIcon(love.image.newImageData("gamedir/icon.png"))
   elseif love.filesystem.exists("icon.png") then
      love.window.setIcon(love.image.newImageData("icon.png"))
   end
   local configPath = nil
   if love.filesystem.exists("gamedir/config.cfg") then
      configPath = "gamedir/config.cfg"
   elseif love.filesystem.exists("config.cfg") then
      configPath = "config.cfg"
   end
   if configPath then
      for line in love.filesystem.lines(configPath) do
         if string.find(line, "resolution") then
            defaultWidth, defaultHeight = string.match(line, "(%d+)%D+(%d+)")
            if defaultWidth / defaultHeight ~= 64 / 48 then
               defaultWidth = 64 * defaultHeight / 48
            end
            love.window.setMode(defaultWidth, defaultHeight)
         elseif string.find(line, "music") then
            if string.find(line, "Volume") then
               musicVolume = string.match(line, "%d+") / 100
               if musicVolume < 0 or musicVolume > 1 then musicVolume = 0.75 end
            elseif (string.find(line, "on") or string.find(line, "true")) then musicOn = true else musicOn = false end 
         elseif string.find(line, "sound") then
            if string.find(line, "Volume") then
                soundVolume = string.match(line, "%d+") / 100
                if soundVolume < 0 or soundVolume > 1 then soundVolume = 0.75 end
            elseif (string.find(line, "on") or string.find(line, "true")) then soundOn = true else soundOn = false end
         end
      end
   else
      defaultWidth = 800
      defaultHeight = 600
      musicOn = true
      musicVolume = 0.75
      soundOn = true
      soundVolume = 0.75
   end
end
