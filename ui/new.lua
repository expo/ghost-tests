local ui = castle.ui

local string = 'hello, world'
local boolean = true
local boolean2 = true
local number = 50
local number2 = 50
local drop = nil

function castle.uiupdate()
    string = ui.textInput('string', string, { helperText = 'Enter a string here!' })
    boolean = ui.checkbox('boolean', boolean)
    boolean2 = ui.toggle('boolean2 on', 'boolean2 off', boolean2)
    number = ui.numberInput('number', number, {
        invalid = number > 50,
        invalidText = "Just kidding, you actually can't go above 50!",
    })
    number2 = ui.slider('number2', number2, 0, 100)
    drop = ui.dropdown('drop', drop, { 'alpha', 'beta', 'gamma', 'delta', 'epsilon', 'zeta' }, {
        helperText = 'Choose a thing!',
        invalid = drop == 'delta',
        invalidText = "I don't like this value... :(",
    })

    if ui.button('Woah!') then
        print('Whoah!')
    end
end

function love.draw()
    love.graphics.print('fps: ' .. love.timer.getFPS(), 20, 20)

    love.graphics.print('\n\nstring: ' .. string, 20, 20)
    love.graphics.print('\n\n\nboolean: ' .. tostring(boolean), 20, 20)
    love.graphics.print('\n\n\n\nboolean2: ' .. tostring(boolean2), 20, 20)
    love.graphics.print('\n\n\n\n\nnumber: ' .. tostring(number), 20, 20)
    love.graphics.print('\n\n\n\n\n\nnumber2: ' .. tostring(number2), 20, 20)
    love.graphics.print('\n\n\n\n\n\n\ndrop: ' .. tostring(drop), 20, 20)
end

function love.keypressed(key)
    if key == 'space' then
        string = string.gsub('............', '.', function() return string.char(math.random(65, 122)) end)
        boolean = math.random(1, 2) == 1
        boolean2 = math.random(1, 2) == 1
        number = math.random(0, 100)
        number2 = math.random(0, 100)
        drop = ({ 'alpha', 'beta', 'gamma', 'delta', 'epsilon', 'zeta' })[math.random(1, 6)]
    end
end