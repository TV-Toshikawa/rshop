function love.load()
    require("api.spec.device")
    require("api.spec.mouse")
    require("api.mathutil")
    device = require("api.spec.devicepreset").pc
    dload.load()
    if not device.console then
        lurker = require("api.3rd.lurker")
    end
    joymode = device.padonly
    logo = love.graphics.newImage("res/icon.png")
    love.window.setIcon(love.image.newImageData("res/icon.png"))
    require("loadapi")
    loadergame()
    require("Asys")
    loadSys()
end
function love.quit()

end