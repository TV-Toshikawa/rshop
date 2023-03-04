function loadSys()
    fntgame = love.graphics.newFont("rmpfont.ttf",30)
    love.graphics.setFont(fntgame)
    mousedebug=true
    socket = require("socket")
    http = require("socket.http")
    spdrun=1
    require("loadapi")
    lang.set(conf.lang)
    clicktitle=false
    hotswap=true
    if device.console then
        if hotswap then
            hotswap = false
            print("[Device]This is console, no hotswap!!")
        end
    end
    love.audio.setVolume(conf.mute and 0 or 1)
end
function love.update(dt)
    love.graphics.setBackgroundColor(1,1,1)
    gui.action()
    mouse.tick(dt)
    if not device.console and hotswap then
        local scanned = lurker.scan()
    end
    if mouse.ison(1) then
        clicktitle=true
    else
        clicktitle=false
    end
end
---@diagnostic disable-next-line: duplicate-set-field
function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    end
    if joymode then
        joymode = false
        print("key")
        mouse.device="mouse"
    end
end
buttonis = function(b,button)
    if b == "a" then
        return(button==1)
    end
    if b == "b" then
        return(button==2)
    end
    if b == "x" then
        return(button==3)
    end
    if b == "y" then
        return(button==4)
    end
    if b == "leftshoulder" then
        return(button==5)
    end
    if b == "rightshoulder" then
        return(button==6)
    end
    if b == "back" then
        return(button==7)
    end
    if b == "start" then
        return(button==8)
    end
    return false
end
function love.joystickpressed(joystick,button)
    joysticks = love.joystick.getJoysticks()[1]
    if not joymode then
        joymode = true
        print("pad")
        mouse.device="stick"
    end
    if buttonis("a",button) then

    end
    if buttonis("x",button) then
        love.quit()
    end
end
function love.mousepressed(x,y,b)
    mouse.mouseevent(x,y,b)
end
function love.wheelmoved(x, y)

end
logopos = 0
logospeed=15
---@diagnostic disable-next-line: duplicate-set-field
function love.draw()
    print(logospeed)
    logopos = logopos + logospeed
    logospeed = logospeed*0.95
    dx,dy = love.graphics.getDimensions()
    if stng then
        gui.draw(guiload.get("settingtitle-"..stngtab))
    else
        love.graphics.setColor(1,1,1)
        love.graphics.setBackgroundColor(1,1,1)
        love.graphics.draw(logo,dx/2-50,dy-logopos,0,0.25,0.25)
        love.graphics.print(lang.gettxt("title.settingsbutton"),275,550,0,2.5,2.5)
    end
    if mousedebug and (not device.console) then
        love.graphics.setColor(0,1,0)
        love.graphics.print((love.mouse.getX().." "..love.mouse.getY()),0,0,0,1,1)
        love.graphics.setColor(1,1,1)
    end
    mouse.draw()
end