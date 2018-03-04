player = {}
player.body = love.physics.newBody(myWorld, 2280,550, "dynamic" ) -- может двигаться
player.shape = love.physics.newRectangleShape(32, 92)
player.fixture = love.physics.newFixture(player.body, player.shape)


player.speed = 200 --- [[5]] горизонтальная скорость игрока
player.angle = 0
player.grounded = false ---[[6]] ложь если человечек в прыжке, истина если стоит на платфоме
player.dead = false

---[[7]] направление движения для смены спрайта 1 - вправо, -1 - влево
player.sprite = sprites.playeranim1s  ---[[7]]
player.body:setFixedRotation(true)  ---[[8]]



player.grid = anim8.newGrid(60,98,120,98)
player.animation = anim8.newAnimation(player.grid('1-2',1),0.4)



  function playerUpdate(dt)

  if player.body:getY() >= 900 then
      player.dead = true
    end

  if player.body:getX() >= 3800 then
  -- CREATE PORTAL TO NEXT LEVEL
end

if player.dead == false then
  if love.keyboard.isDown("down") then
      player.sprite = sprites.playeran
        player.body:applyLinearImpulse(0, 40)
      else
      player.sprite = sprites.playeranim1s
  if love.keyboard.isDown("left") then

      player.body:setX(player.body:getX() - player.speed*dt)
    ---[[7]] повернем спрайт влево
      player.sprite = sprites.player1animm
    else
      player.sprite = sprites.playeranim1s

  if love.keyboard.isDown("right") then
        player.body:setX(player.body:getX() + player.speed*dt)
        player.sprite = sprites.playerani
      else
        player.sprite = sprites.playeranim1s



--  if love.keyboard.isDown("p") then
        --player.angle =   player.angle + math.pi*dt
--  end
  --if love.keyboard.isDown("i") then --вращение влево
--        player.angle =   player.angle - math.pi*dt
--  end






end
end
end


end
end
