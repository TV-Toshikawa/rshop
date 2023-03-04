function loadergame()
    love.graphics.clear()
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill",0,0,10000,10000)
    love.graphics.present()
    --loaders
    require("api.loader.texload")
    require("api.loader.guiloader")
    require("api.loader.sfx")
    --general
    require("api.misc")
    require("api.langsys")
    require("api.gui")
    --activate loader
    texture.load()
    guiload.loadgui()
    sfx.loadsound()
    love.audio.setVolume(0.25)
end