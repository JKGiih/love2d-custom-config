audio = {}

function audio.initialize()
   local exists = love.filesystem.exists
   local newSource = love.audio.newSource
   if exists("assets/bgm.ogg") then 
      music = love.audio.newSource("assets/bgm.ogg")
      music:setLooping(true)
      musicAvailable = true
      audio.setMusicVolume()
      music:play()
   else
      musicAvailable = false
   end
   if exists("assets/sf1.ogg") and exists("assets/sf2.ogg") then
      sf1 = newSource("assets/sf1.ogg", static)
      sf1:setLooping(true)
      sf2 = newSource("assets/sf2.ogg", static)
      sf2:setLooping(false)
      soundAvailable = true
      audio.setSoundVolume()
   else
      soundAvailable = false
   end
end

function audio.randomizePitch(effect)
   local newPitch = (effect:getPitch() + 1.5^(love.math.random(2) * 2 - 3)) / 2
   if newPitch < 0.8 then newPitch = 0.8 end
   if newPitch > 1.2 then newPitch = 1.2 end
   effect:setPitch(newPitch)
end

function audio.playEffect(effect)
   effect:play()
end

function audio.stopEffect(effect)
   effect:stop()
end

function audio.pauseEffect(effect)
   effect:pause()
end

function audio.resumeEffect(effect)
   effect:resume()
end

function audio.toggleSound()
   soundOn = not soundOn
end

function audio.toggleMusic()
   musicOn = not musicOn
   if musicAvailable then
      if musicOn then
         love.audio.resume(music)
      else
         love.audio.pause(music)
      end
   end
end

function audio.setSoundVolume()
   if soundAvailable then
      sf1:setVolume(soundVolume)
      sf2:setVolume(soundVolume)
   end 
end

function audio.setMusicVolume()
   if musicAvailable then music:setVolume(musicVolume) end
end

function audio.lowerSoundVolume()
   soundVolume = soundVolume - 0.25
   if soundVolume < 0 then soundVolume = 0 end
   audio.setSoundVolume()
end

function audio.raiseSoundVolume()
   soundVolume = soundVolume + 0.25
   if soundVolume > 1 then soundVolume = 1 end
   audio.setSoundVolume()
end

function audio.lowerMusicVolume()
   musicVolume = musicVolume - 0.25
   if musicVolume < 0 then musicVolume = 0 end
   audio.setMusicVolume()
end

function audio.raiseMusicVolume()
   musicVolume = musicVolume + 0.25
   if musicVolume > 1 then musicVolume = 1 end
   audio.setMusicVolume()
end
