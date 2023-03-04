local upd = false
local dwd = false
controller = {
    tick = function(delta)
        if joymode then
            controller.padtick(delta)
        else
            controller.keytick(delta)
        end
    end,
    abutton = function ()
        if joymode then
            return joysticks:isGamepadDown("a")
        else
            return love.keyboard.isDown("space")
        end
        return false
    end,
    keytick = function (dt)

    end,
    padtick = function (dt)
        local y = 0
        if buttonis("dpup",0) and (not upd) then
            y = y + 1
            upd = true
        else
            if not buttonis("dpup",0) then
            upd = false
            end
        end
        if buttonis("dpdown",0) and (not dwd) then
            y = y - 1
            dwd = true
        else
        if not buttonis("dpdown",0) then
            dwd = false
            end
        end
    end
}
function gamekey(key)
    if love.keyboard.isDown("escape") then
        if love.keyboard.isDown("l") then
            misc.save.savegame()
            title=true
        else

        end
    end
end
function gamepad(button)
    if buttonis("x",button) then

    end
    if  buttonis("back",button) then

    end
    if buttonis("start",button) then

    end
    if buttonis("rightshoulder",button) then

    end
    if buttonis("leftshoulder",button) then

    end
    if buttonis("b",button) then

    end
end