function love.load()


  --- Sprites
  sprites = {}
    sprites.pusto = love.graphics.newImage('sprites/pusto.png')
  sprites.nps = love.graphics.newImage('sprites/zombie.png')
  sprites.coin_sheet   = love.graphics.newImage('sprites/coin_sheet.png')
  sprites.player_jump  = love.graphics.newImage('sprites/444.png')
  sprites.player_standh = love.graphics.newImage ('sprites/123.png')
  sprites.player_stand = love.graphics.newImage('sprites/333.png')
  sprites.player_stands = love.graphics.newImage('sprites/555.png')
  sprites.player_standi = love.graphics.newImage ('sprites/222.png')
  sprites.player_1w = love.graphics.newImage ('sprites/444_1.png')
    sprites.player_1s = love.graphics.newImage ('sprites/123_1.png')
      sprites.player_1d = love.graphics.newImage ('sprites/333_1.png')
        sprites.player_1 = love.graphics.newImage ('sprites/555_1.png')
          sprites.player_1a = love.graphics.newImage ('sprites/222_1.png')
          sprites.anim = love.graphics.newImage ('animation/99.png')
              sprites.anim1 = love.graphics.newImage ('animation/a2.png')
  sound = love.audio.newSource("sounds/muz.mp3")
sound:setLooping(true)
sound:setVolume (0.2)
sound: setPitch(0.9)
coin_sound = love.audio.newSource('/sounds/coin.mp3')
coin_sound:setVolume(0.8)
 coin_sound:setPitch(0.9)
gameState  =  1 --состояние игры.  1 - стоп игра, 2 - играем

  score = 0 -- счет собранных монет
  timer = 0 -- исходная установка счетчика времени
  timer1 = 0
myFont = love.graphics.newFont(20) -- сделаем размер фонта больше
button = {} -- 1 плеер
 button.x = 630
 button.y = 338
 button.size = 40
 button1 = {} --выход
 button1.x = 630
 button1.y = 500
  button1.size = 40
  button2 = {} -- 2 плеер
  button2.x = 630
  button2.y = 400
   button2.size = 40


  --- Add physics and setup gravitati
    myWorld = love.physics.newWorld(0, 500, false)
    myWorld1 = love.physics.newWorld(0, 500, false)
    myWorld2 = love.physics.newWorld(0, 500, false)

    ---[[6]] введем обработку коллизий для того что бы определить
    -- соприкасается ли человечек с платформой
    myWorld:setCallbacks(beginContact, endContact, preSolve, postSolve)
    myWorld1:setCallbacks(beginContact1, endContact1, preSolve1, postSolve1)
    myWorld2:setCallbacks(beginContact2, endContact2, preSolve2, postSolve2)
  anim8 = require('anim8')
    require('player')
    require('player_1')
require ('nps')
Camera = require('camera')
  cam = Camera()
  --  require('camera')
    require('coin')
  --  require('coid')

      -- Setup library
      sti = require('sti')
      gameMap = sti("maps/GameMap.lua")
love.graphics.setBackgroundColor(50,110,255)



  --  Platforms
  platforms = {}
  --spawnPlatform(50, 420, 300, 30)
  --spawnPlatform(500, 350, 270, 30)
  --spawnPlatform(1150, 350, 100, 30)
  --spawnPlatform(950, 280, 165, 30)


    for i,obj in ipairs(gameMap.layers["coins"].objects) do
     spawnCoin(obj.x, obj.y, obj.width, obj.height)

   end -- Coins
end
--============================================
function love.update(dt)
if gameState == 2 then
  cam:lookAt(player.body:getX(), love.graphics.getHeight()/2)
end
if gameState == 1 then
  cam:lookAt(love.graphics.getWidth()/2+2, love.graphics.getHeight()/2)
end
if player.dead == true then
  cam:lookAt(player_1.body1:getX(), love.graphics.getHeight()/2)
end
if player_1.dead == true and player.dead == true then
  gameState = 1
    cam:lookAt(love.graphics.getWidth()/2+5610, love.graphics.getHeight()/2)
  end
  myWorld:update(dt)
  myWorld1:update(dt)
  myWorld2:update(dt)
  gameMap:update(dt)

  coinUpdate(dt)
-----------------------------------------  playeranimation:update(dt)

playerUpdate(dt)
player_1Update(dt)


if gameState == 2 then
 timer = timer + dt
end
if timer < 0 then
  timer = 0
  gameState = 1
end
if timer1 < 0 then
 timer1 = timer1 + dt
end


--  for i,p in ipairs(coids) do
--         p.animation:update(dt)
--      end



  for i,c in ipairs(coins) do
      c.animation:update(dt)
    end
end






function love.draw()
        function love.mousepressed(x, y, b, isTouch)
  if gameState == 1 then
 if distanceBetween(button2.x, button2.y, love.mouse.getX(), love.mouse.getY()) < button2.size then
  gameState = 2
else if
distanceBetween(button1.x, button1.y, love.mouse.getX(), love.mouse.getY()) < button1.size then
  love.event.quit()
  else if
    distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
    player_1.dead = true
  gameState = 2

  end
end
end


end
  end
  if gameState == 1 then
    if love.keyboard.isDown("k") then
    gameState = 2
    end
    if gameState == 1 then
      if love.keyboard.isDown("l") then
        player_1.dead = true
      gameState = 2
    end
  end
  end
  if love.keyboard.isDown("escape") then
      love.event.quit()

    end
  if love.keyboard.isDown("space") then
      love.event.quit("restart")
  end
    if love.keyboard.isDown("up") then
  player.sprite = sprites.player_jump
  end
  if love.keyboard.isDown("f1") then
    sound:play()
  end
  if love.keyboard.isDown("f2") then
    sound:pause()
  end
  if love.keyboard.isDown("f3") then
    sound:stop()
  end
  --if player.dead == true then
    --  sound:play()
  --end

  function spawnPlatform(x, y, width, height)
    local platform = {}
    platform.body = love.physics.newBody(myWorld, x, y, "static") -- тело статичное
    platform.shape = love.physics.newRectangleShape(width/2, height/2, width, height) --[[4]]
    platform.fixture = love.physics.newFixture(platform.body, platform.shape)
    platform.width = width
    platform.height = height
    platform.body1 = love.physics.newBody(myWorld1, x, y, "static") -- тело статичное
    platform.shape1 = love.physics.newRectangleShape(width/2, height/2, width, height) --[[4]]
    platform.fixture1 = love.physics.newFixture(platform.body1, platform .shape1)




  -- Draw player 1
  love.graphics.draw(player_1.sprite, player_1.body1:getX(), player_1.body1:getY(),
  player_1.angle, player_1.direction, 1, sprites.player_1d:getWidth()/2, sprites.player_1d:getHeight()/2 )
  -- Draw player 2
  love.graphics.draw(player.sprite, player.body:getX(), player.body:getY(),
  player.angle, player.direction, 1,sprites.player_stands:getWidth()/2,sprites.player_stands:getHeight()/2 )
  end
    cam:attach()

for i, p in ipairs (platforms) do
  love.graphics.rectangle('fill', p.body:getX(), p.body:getY(), p.width, p.height)
end
-- 2nd Draw player
love.graphics.draw(player.sprite, player.body:getX(), player.body:getY(),
player.angle, player.direction, 1,sprites.player_stands:getWidth()/2,sprites.player_stands:getHeight()/2 )
love.graphics.draw(player_1.sprite, player_1.body1:getX(), player_1.body1:getY(),
player_1.angle, player_1.direction, 1, sprites.player_1d:getWidth()/2, sprites.player_1d:getHeight()/2 )

  gameMap:drawLayer(gameMap.layers["tile_level_1"])

  for i,obj in ipairs(gameMap.layers["tile_objects"].objects) do
    spawnPlatform(obj.x, obj.y, obj.width, obj.height)

    for i,c in ipairs(coins) do
      c.animation:draw(sprites.coin_sheet, c.x, c.y, nil, nil, nil, 20.5, 21)
    end
    end

    love.graphics.setFont(myFont)
    love.graphics.print ("Player 2", 600, 400)
    love.graphics.print ("Exit", 615, 500)
    love.graphics.print ("Player 1", 600, 338)
      love.graphics.print ("Game over", 6200, 338)
      love.graphics.print("Shuichi",player.body:getX()-35, player.body:getY()-70)
     if player_1.dead == false then
        love.graphics.print("Kaito", player_1.body1:getX()-30, player_1.body1:getY()-70)
      end
      cam:detach()
    love.graphics.setFont(myFont)
    if gameState == 2 then
      love.graphics.print("Timer = " ..  math.floor(timer), 1250, 0)
    end
  --  love.graphics.setFont(myFont)
    -- love.graphics.print("kd jump = " ..  math.floor(timer1), 150, 0)



  -----------------------------------------------playeranimation:draw(sprites.anim, player.body:getX(), player.body:getY(), nil, nil, nil, sprites.anim:getWidth()/2, sprites.anim:getHeight()/2 )


  --  playeranimation:draw(sprites.coin_sheet, player_1.body1:getX(), player_1.body1:getY())
  --love.graphics.setColor(255,255,255)
  if gameState == 2 then
  love.graphics.setFont(myFont)
  love.graphics.print("Coins = "..score , 10 , 0)
end

  --Draw coins into file coin.lua


--for i,p in ipairs(coids) do
--  p.animation:draw(sprites.coin_sheet, p.x, p.y)
--end

end



---================= секция функций ============
---[[3]] -- генерация блоков платформы   -----
function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 +  (x2 -x1)^2 )
end

function love.keypressed(key, scancode, isrepeat)
  if key =="up" and player.grounded == true then ---[[6]]
  player.body:applyLinearImpulse(0, -1150)
  timer1 = timer1 - 5
elseif key == "w" then
  if key == "w" and player_1.grounded1 == true then
player_1.body1:applyLinearImpulse(0, -1150)
end
  end
end

function beginContact(a,b, coll)
  player.grounded = true
end
-----------------------------------------
function endContact(a, b, coll)
    player.grounded = false
  end


function beginContact1(a,b, coll)
  player_1.grounded1 = true
end
-----------------------------------------
function endContact1(a, b, coll)
    player_1.grounded1 = false
  end
