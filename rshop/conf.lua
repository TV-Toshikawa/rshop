function love.conf(t)
    json = require("api.3rd.json")
    require("api.mathutil")
    t.identity = "eggtoast_rshop"
    t.window.title = "RShop"
    t.version = "11.3"
    t.window.width = 1024
    t.window.height = 768
    t.window.resizable = true
    t.gammacorrect = false
    t.externalstorage = false
    t.accelerometerjoystick = false
    t.window.vsync = true

    t.audio.mic = false

    info = love.filesystem.getInfo("cfg.json")
    if info == nil then
        love.filesystem.newFile("cfg.json")
        love.filesystem.write("cfg.json",'{"mute":false,"lang":"enus"}')
    end
    info = love.filesystem.getInfo("cache")
    if info == nil then
        love.filesystem.createDirectory("cache")     
    end
    conf = json.decode(love.filesystem.read("cfg.json"))
    if not table.haskey(conf,"lang") then
        conf.lang = "enus"
    end
    if not table.haskey(conf,"mute") then
        conf.mute=false
    end
    love.filesystem.write("cfg.json",json.encode(conf))  

    t.window.resizable=not conf.locksize
end