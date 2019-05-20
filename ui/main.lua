local ui = castle.ui

local selectVal = 'banana'
local textAreaVal = [[
### Hello, world

Type some things here and have it render using [markdown](https://en.wikipedia.org/wiki/Markdown) below!]]

function castle.uiupdate()
    ui.box({ gap = 'small' }, function()
        ui.text('selectVal')
        selectVal = ui.select('selectVal', selectVal, { 'banana', 'mushroom', 'orange' })

        ui.text('textAreaVal')
        textAreaVal = ui.textArea('textAreaVal', textAreaVal)

        ui.markdown(textAreaVal)
    end)
end

function love.draw()
    love.graphics.print([[
fps: ]] .. love.timer.getFPS() .. [[\n

selectVal: ]] .. selectVal .. [[\n
textAreaVal: ]] .. textAreaVal .. [[\n
    ]], 20, 20)
end