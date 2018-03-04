npc = {}
npc.x = 2000
npc.y = 540
npc.speed = 50
npc.sprite = sprites.npcanim
npc.grid = anim8.newGrid(65,91,130,91)
npc.animation = anim8.newAnimation(npc.grid('1-2',1),0.4)
npc.r = 1
npcstate = 1


---ДВИЖУХА НПС
function animmoveUpdate(dt)
if npc.x >= 2500 then
  npcstate = 2
elseif npc.x == 2000 then
  npcstate = 1
end
if  npcstate == 2 then
  npc.x = npc.x - npc.speed * dt
  npc.sprite = sprites.npcanimm2
else
if npcstate == 1 then
  npc.x = npc.x + npc.speed * dt
  npc.sprite = sprites.npcanimm
end
--заготовка на диалог
if ncpstate == 0 then
  npc.sprite = sprite.npcanim
end
end
end
