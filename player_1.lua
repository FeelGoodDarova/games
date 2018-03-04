player_1 = {}
player_1.body1 = love.physics.newBody(myWorld1, 2140,550, "dynamic" ) -- тело может двигаться
player_1.shape1 = love.physics.newRectangleShape(32, 92)
player_1.fixture1 = love.physics.newFixture(player_1.body1, player_1.shape1)
player_1.speed = 200 --- [[5]] горизонтальная скорость игрока
player_1.angle = 0
player_1.grounded1 = false ---[[6]] ложь если человечек в прыжке, истина если стоит на платфоме
player_1.dead = false

---[[7]] направление движения для смены спрайта 1 - вправо, -1 - влево
player_1.sprite = sprites.playeranki
player_1.body1:setFixedRotation(true)



player_1.grid = anim8.newGrid(60,98,120,98)
player_1.animation = anim8.newAnimation(player_1.grid('1-2',1),0.4)


function player_1Update(dt)
  if player_1.dead == true then
    player_1.sprite = sprites.pusto
  end
  if player_1.body1:getY() >= 900 then
    player_1.dead = true
  end

if player_1.dead == false then
if love.keyboard.isDown("s") then
        player_1.sprite = sprites.playerankij
  player_1.body1:applyLinearImpulse(0, 40)
        else
        player_1.sprite = sprites.playeranki
    if love.keyboard.isDown("a") then

        player_1.body1:setX(player_1.body1:getX() - player_1.speed*dt)
---[[7]] повернем спрайт влево
        player_1.sprite = sprites.playeranl
      else
        player_1.sprite = sprites.playeranki

    if love.keyboard.isDown("d") then
          player_1.body1:setX(player_1.body1:getX() + player_1.speed*dt)
          player_1.sprite = sprites.playerank
        else
          player_1.sprite = sprites.playeranki

    ---[[7]] повернем спрайт вправо

--    if love.keyboard.isDown("q") then
--          player_1.angle =   player_1.angle + math.pi*dt
--    end
-- if love.keyboard.isDown("e") then --вращение влево
  --        player_1.angle =   player_1.angle - math.pi*dt
  --  end



  ---- [[6]]  -- обработка коллизий


    ---- [[6]]  -- обработка коллизий



  end
  end
  end

end
end
