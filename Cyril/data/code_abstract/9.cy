// travel through big boxes

// perspective
move -10,0,1
rotate 270, 0,1,0

pos: rand(30) - 15
move 0,0,pos

DECAY: 0.001
particle 0.2
  fill
  //color hsv(0, 255, map(HEALTH,1,0, 200,0))
  color red
  box 0.5
end


